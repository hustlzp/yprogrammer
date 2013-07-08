#-*- coding: UTF-8 -*-
import requests
from django.http import HttpResponse
from django.shortcuts import render
from users.models import User

def login(request):
    # get access token
    access_token_url = "https://github.com/login/oauth/access_token"
    code = request.GET['code']
    params = {
        'client_id': '7a68fc19935c680f8e2e',
        'redirect_uri': 'http://localhost:8000/login/github',
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
        u = User(name=name, email=user_info['email'], avatar_url=user_info['avatar_url'], blog=user_info['blog'], location=user_info['location'])
        u.save()
        return HttpResponse('new')
    else:
        return HttpResponse('old')

def user(request, username):
    pass


