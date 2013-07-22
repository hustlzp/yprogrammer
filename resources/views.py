#-*- coding: UTF-8 -*-
import json
from django.http import HttpResponse
from django.shortcuts import render, redirect
from resources.models import Resource, ResourceType, Node, NodeType, NodeFollow, ResourceCollect
from users.models import User

def resources(request):
    if not 'user' in request.session:
        resources = Resource.objects.all().order_by('-create_time')[:10]
    else:
        followed_nodes = NodeFollow.objects.filter(user=request.session['user_id']).values('node')
        resources = Resource.objects.filter(node__in=followed_nodes).order_by('-create_time')[:10]
        for r in resources:
            r.collect_count = ResourceCollect.objects.filter(resource=r.id).count()

    return render(request, 'resources/resources.html', {'resources': resources})

def resource(request, r_id):
    resource = Resource.objects.get(id=r_id)
    collect_count = ResourceCollect.objects.filter(resource=r_id).count()
    return render(request, 'resources/resource.html', {'resource': resource, 'collect_count': collect_count})

# ajax - collect a resource
def collect_resource(request):
    if request.method == 'POST':
        if not 'user' in request.session:
            return HttpResponse('unlogin')
        
        u = User.objects.get(name=request.session['user'])
        r_id = request.POST['r_id']
        r = Resource.objects.get(id=r_id)
        if ResourceCollect.objects.filter(user=u.id, resource=r.id).count() == 0:
            ResourceCollect.objects.create(user=u, resource=r)

        # follow relative node
        if NodeFollow.objects.filter(user=u.id, node=r.node.id).count() == 0:
            NodeFollow.objects.create(user=u, node=r.node)

        return HttpResponse('success')

# ajax - discollect a resource
def discollect_resource(request):
    if request.method == 'POST':
        if not 'user' in request.session:
            return HttpResponse('unlogin')

        rc = ResourceCollect.objects.filter(user=request.session['user_id'], resource=request.POST['r_id'])
        if rc.count() > 0:
            rc.delete()
        
        return HttpResponse('success')

def my_nodes(request):
    if not 'user_id' in request.session:
        return redirect('all_nodes')
        
    node_follows = NodeFollow.objects.filter(user=request.session['user_id'])
    for nf in node_follows:
        nf.resources = Resource.objects.filter(node=nf.node.id).order_by('-create_time')[:3]

    return render(request, 'resources/my_nodes.html', {'node_follows': node_follows})

def all_nodes(request):
    node_types = NodeType.objects.all()
    return render(request, 'resources/all_nodes.html', {'node_types': node_types})

def node(request, n_id):
    node = Node.objects.get(id=n_id)
    follow_count = NodeFollow.objects.filter(node=n_id).count()

    resource_types = ResourceType.objects.filter(node=n_id)
    for rt in resource_types:
        rt.resources = Resource.objects.filter(node=n_id, type=rt.id).order_by('-create_time')
        for r in rt.resources:
            r.collect_count = ResourceCollect.objects.filter(resource=r.id).count()

    resources = Resource.objects.filter(node=n_id).order_by('-create_time')[:10]
    for r in resources:
        r.collect_count = ResourceCollect.objects.filter(resource=r.id).count()

    return render(request, 'resources/node.html', {'node': node, 'resources': resources, 'resource_types': resource_types, 'follow_count': follow_count})

# ajax - follow a node
def follow_node(request):
    if not 'user' in request.session:
        return HttpResponse('unlogin')

    u = User.objects.get(name=request.session['user'])
    n_id = request.POST['n_id']
    n = Node.objects.get(id=n_id)
    if NodeFollow.objects.filter(user=u.id, node=n.id).count() == 0:
        NodeFollow.objects.create(user=u, node=n)
    return HttpResponse('success')

# ajax - disfollow a node
def disfollow_node(request):
    if not 'user' in request.session:
        return HttpResponse('unlogin')
    
    user_id = request.session['user_id']
    n_id = request.POST['n_id']
    nf = NodeFollow.objects.filter(user=user_id, node=n_id)
    if nf.count() > 0:
        nf.delete()
    return HttpResponse('success')
