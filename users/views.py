#-*- coding: UTF-8 -*-
import requests
from django.http import HttpResponse
from django.shortcuts import render, redirect
from users.models import User
from resources.models import Node, NodeFollow, Resource, ResourceCollect

# sign by github oauth2
def signin(request):
    # get access token
    access_token_url = "https://github.com/login/oauth/access_token"
    code = request.GET['code']
    params = {
        'client_id': '7a68fc19935c680f8e2e',
        'redirect_uri': 'http://localhost:8000/signin/github',
        'client_secret': 'cc806b6c5c30b4eff569e86c634cb778e23d273e',
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
        return render(request, 'users/new.html', {'user_info': user_info})
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
    user_id = User.objects.create(name=request.POST['name'], email=request.POST['email'], avatar_url=request.POST['avatar_url']).id
    request.session['user'] = name=request.POST['name']
    request.session['user_id'] = user_id
    request.session['user_avatar'] = request.POST['avatar_url']
    return redirect('resources')

def follow_nodes(request):
    pass

def user(request, username):
    pass

def user_nav(request):
    user_id = request.session['user_id']
    nodes = NodeFollow.objects.filter(user=user_id).order_by('order')
    for n in nodes:
        n.resources = ResourceCollect.objects.filter(user=user_id, resource__node__id=n.node.id).order_by('order')
    return render(request, 'users/nav.html', {'nodes': nodes})

