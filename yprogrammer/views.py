#-*- coding: UTF-8 -*-
from django.http import HttpResponse
from django.shortcuts import render, redirect
from resources.models import Resource, ResourceType, Node, NodeType, NodeFollow, ResourceCollect
from users.models import User

def index(request):
    if 'user' in request.session:
        return redirect('resources')
    else:
        return render(request, 'index.html')