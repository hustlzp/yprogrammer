#-*- coding: UTF-8 -*-
import requests
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.conf import settings
from django.db.models import Count
from users.models import User
from resources.models import Node, NodeFollow, NodeType, Resource, ResourceCollect
from forms import UserForm

# sign by github oauth2
def signin(request):
    # get access token
    access_token_url = "https://github.com/login/oauth/access_token"
    code = request.GET['code']
    params = {
        'client_id': settings.CLIENT_ID,
        'redirect_uri': settings.REDIRECT_URL,
        'client_secret': settings.CLIENT_SECRET,
        'code': code
    }
    headers = {'Accept': 'application/json'}
    r = requests.post(access_token_url, params=params, headers=headers)
    token = r.json()['access_token']

    # get user info
    r = requests.get('https://api.github.com/user', params={'access_token': token})
    user_info = r.json()

    # if new, save it
    name = user_info['login']
    if User.objects.filter(name=name).count() < 1:
        form = UserForm(initial={
            'name': name,
            'avatar_url': user_info['avatar_url'],
            'email': user_info['email'] if 'email' in user_info else ''
        })
        return render(request, 'users/new.html', {'form': form})
    else:
        # set session
        user_id = User.objects.get(name=name).id
        request.session['user'] = name
        request.session['user_id'] = user_id
        request.session['user_avatar'] = user_info['avatar_url']
        return redirect('resources')

def signout(request):
    del request.session['user']
    del request.session['user_id']
    del request.session['user_avatar']
    return redirect('index')

def new(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            avatar_url = form.cleaned_data['avatar_url']
            user_id = User.objects.create(name=name, email=email, avatar_url=avatar_url).id
            request.session['user'] = name
            request.session['user_id'] = user_id
            request.session['user_avatar'] = avatar_url
            return redirect('init_follow_nodes')
    return render(request, 'users/new.html', {'form': form})

def init_follow_nodes(request):
    node_types = NodeType.objects.all()
    for nt in node_types:
        nt.nodes = Node.objects.filter(type=nt.id)
        for n in nt.nodes:
            n.is_followed = False
    return render(request, 'users/init_follow_nodes.html', {'node_types': node_types})    

# helper function, get the canonical blog url for displaying
def canonical_blog(u):
    if u.startswith("http://"):
        u = u[7:]
    if u.startswith("www."):
        u = u[4:]
    if u.endswith("/"):
        u = u[:-1]
    return u

# page user profile
#-----------------------------------------------#
def user(request, username):
    user = User.objects.get(name=username)
    user.c_blog = canonical_blog(user.blog)
    nodes = NodeFollow.objects.filter(user=user.id).order_by('order')
    for n in nodes:
        n.resources = ResourceCollect.objects.filter(user=user.id, resource__node__id=n.node.id).order_by('order')

    collect_list = ResourceCollect.objects.filter(user=user.id).values('resource')
    resources = Resource.objects.annotate(collect_count=Count('collects')).filter(id__in=collect_list).order_by('-create_time')[:10]
    return render(request, 'users/user.html', {'user': user, 'resources': resources, 'nodes': nodes})

def user_nav(request):
    user_id = request.session['user_id']
    nodes = NodeFollow.objects.filter(user=user_id).order_by('order')
    for n in nodes:
        n.resources = ResourceCollect.objects.filter(user=user_id, resource__node__id=n.node.id).order_by('order')
    return render(request, 'users/nav.html', {'nodes': nodes})
