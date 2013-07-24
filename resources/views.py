#-*- coding: UTF-8 -*-
import json
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.db.models import Count
from resources.models import Resource, ResourceType, Node, NodeType, NodeFollow, ResourceCollect
from users.models import User

def resources(request):
    if not 'user' in request.session:
        resources = Resource.objects.annotate(collect_count=Count('collects')).all().order_by('-create_time')[:10]
    else:
        followed_nodes = NodeFollow.objects.filter(user=request.session['user_id']).values('node')
        resources = Resource.objects.annotate(collect_count=Count('collects')).filter(node__in=followed_nodes).order_by('-create_time')[:10]

    return render(request, 'resources/resources.html', {'resources': resources})

def resource(request, r_id):
    resource = Resource.objects.annotate(collect_count=Count('collects')).get(id=r_id)
    return render(request, 'resources/resource.html', {'resource': resource})

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
    node = Node.objects.annotate(follow_count=Count('follows')).get(id=n_id)
    mode = request.GET['mode'] if 'mode' in request.GET and request.GET['mode'] in ['type', 'time', 'popular'] else 'time'

    if mode == 'type':
        resource_types = ResourceType.objects.filter(node=n_id)
        for rt in resource_types:
            rt.resources = Resource.objects.annotate(collect_count=Count('collects')).filter(node=n_id, type=rt.id).order_by('-collect_count')[:10]
        return render(request, 'resources/node.html', {'node': node, 'mode': mode, 'resource_types': resource_types})
    elif mode in ['time', 'popular']:
        resources = Resource.objects.annotate(collect_count=Count('collects')).filter(node=n_id)
        if mode == 'time':
            resources = resources.order_by('-create_time')[:10]
        else:
            resources = resources.order_by('-collect_count')[:10]
        return render(request, 'resources/node.html', {'node': node, 'mode': mode, 'resources': resources})

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

def add_resource(request):
    u_id = request.session['user_id']
    user = User.objects.get(id=u_id)
    node = Node.objects.get(id=request.POST['node'])
    res_type = ResourceType.objects.get(id=request.POST['type'])
    res = Resource.objects.create(node=node, creator=user, title=request.POST['title'], type=res_type, url=request.POST['url'], desc=request.POST['desc'])

    # collect it
    if ResourceCollect.objects.filter(user=u_id, resource=res.id).count() == 0:
        ResourceCollect.objects.create(user=user, resource=res)

    # follow relative node
    if NodeFollow.objects.filter(user=u_id, node=node.id).count() == 0:
        NodeFollow.objects.create(user=user, node=node)

    return HttpResponse('success')

def add_resource_type(request):
    node = Node.objects.get(id=request.POST['n_id'])
    type_id = ResourceType.objects.create(node=node, type=request.POST['type']).id
    return HttpResponse(type_id)

# ajax - get resource types by node
def get_resource_types_by_node(request):
    n_id = request.POST['n_id']
    types = ResourceType.objects.filter(node=n_id).values('id', 'type')
    return HttpResponse(json.dumps(list(types)))

# ajax - get resource types by followed nodes
def get_resource_types_by_followed_nodes(request):
    follow_list = NodeFollow.objects.filter(user=request.session['user_id']).values('node')
    nodes = Node.objects.filter(id__in=follow_list).values('id').order_by('type')
    for n in nodes:
        n['types'] = list(ResourceType.objects.filter(node=n['id']).values('id', 'type'))
    return HttpResponse(json.dumps(list(nodes)))
