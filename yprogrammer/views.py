#-*- coding: UTF-8 -*-
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.conf import settings
from resources.models import Resource, ResourceType, Node, NodeType, NodeFollow, ResourceCollect
from users.models import User

def index(request):
    if 'user' in request.session:
        return redirect('resources')
    else:
        return render(request, 'index.html', {'client_id': settings.CLIENT_ID, 'redirect_url': settings.REDIRECT_URL})