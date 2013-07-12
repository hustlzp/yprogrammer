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
        user_id = User.objects.create(name=name, email=user_info['email'], avatar_url=user_info['avatar_url'], blog=user_info['blog'], location=user_info['location']).id
    else:
        user_id = User.objects.get(name=name).id

    # set session
    request.session['user'] = name
    request.session['user_id'] = user_id
    request.session['user_avatar'] = user_info['avatar_url']
    return redirect('resources')

def signout(request):
    del request.session['user']
    del request.session['user_id']
    del request.session['user_avatar']
    return redirect('resources')

def user(request, username):
    pass

def user_nav(request):
    user_id = request.session['user_id']
    nodes = NodeFollow.objects.filter(user=user_id)
    for n in nodes:
        n.resources = ResourceCollect.objects.filter(user=user_id, resource__node__id=n.node.id)
    # nodes = Node.objects.all()
    # for n in nodes:
    #     n.resources = Resource.objects.filter(node=n.node.id)
    return render(request, 'users/nav.html', {'nodes': nodes})

