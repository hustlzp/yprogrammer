#-*- coding: UTF-8 -*-
from django.http import HttpResponse
from django.shortcuts import render, redirect
from resources.models import Resource, Node, NodeFollow
from users.models import User

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
    if 'user_id' in request.session and NodeFollow.objects.filter(user=request.session['user_id'], node=n_id).count() > 0:
        is_followed = True
    else:
        is_followed = False
    return render(request, 'resources/node.html', {'node': node, 'resources': resources, 'is_followed': is_followed})

def follow_node(request, n_id):
    u = User.objects.get(name=request.session['user'])
    n = Node.objects.get(id=n_id)
    if NodeFollow.objects.filter(user=u.id, node=n_id).count() == 0:
        NodeFollow.objects.create(user=u, node=n)
    return redirect('node', n_id=n_id)

def disfollow_node(request, n_id):
    user_id = request.session['user_id']
    n = NodeFollow.objects.filter(user=user_id, node=n_id)
    if n.count() > 0:
        n.delete()
    return redirect('node', n_id=n_id)
