#-*- coding: UTF-8 -*-
from django.http import HttpResponse
from django.shortcuts import render
from resources.models import Resource
from resources.models import Node

def resources(request):
    resources = Resource.objects.all().order_by('-create_time')[:10]
    return render(request, 'resources/resources.html', {'resources': resources})

def resource(request, r_id):
    resource = Resource.objects.get(id=r_id)
    return render(request, 'resources/resource.html', {'resource': resource})

def nodes(request):
    nodes = Node.objects.all()[:10]
    return render(request, 'resources/nodes.html', {'nodes': nodes})

def node(request, n_id):
    node = Node.objects.get(id=n_id)
    resources = Resource.objects.filter(node=n_id).order_by('-create_time')
    return render(request, 'resources/node.html', {'node': node, 'resources': resources})