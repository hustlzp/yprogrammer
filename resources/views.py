#-*- coding: UTF-8 -*-
from django.http import HttpResponse
from django.shortcuts import render, redirect
from resources.models import Resource, ResourceType, Node, NodeType, NodeFollow, ResourceCollect
from users.models import User

def resources(request):
    resources = Resource.objects.all().order_by('-create_time')[:10]
    for r in resources:
        r.collect_count = ResourceCollect.objects.filter(resource=r.id).count()
        if 'user_id' in request.session and ResourceCollect.objects.filter(user=request.session['user_id'], resource=r.id).count() > 0:
            r.is_collected = True
        else:
            r.is_collected = False
    return render(request, 'resources/resources.html', {'resources': resources})

def resource(request, r_id):
    resource = Resource.objects.get(id=r_id)
    collect_count = ResourceCollect.objects.filter(resource=r_id).count()
    if 'user_id' in request.session and ResourceCollect.objects.filter(user=request.session['user_id'], resource=r_id).count() > 0:
        is_collected = True
    else:
        is_collected = False
    return render(request, 'resources/resource.html', {'resource': resource, 'is_collected': is_collected, 'collect_count': collect_count})

def collect_resource(request, r_id):
    u = User.objects.get(name=request.session['user'])
    r = Resource.objects.get(id=r_id)
    if ResourceCollect.objects.filter(user=u.id, resource=r.id).count() == 0:
        ResourceCollect.objects.create(user=u, resource=r)
    # follow relative node
    if NodeFollow.objects.filter(user=u.id, node=r.node.id).count() == 0:
        NodeFollow.objects.create(user=u, node=r.node)
    return redirect(request.META['HTTP_REFERER'])

def discollect_resource(request, r_id):
    rc = ResourceCollect.objects.filter(user=request.session['user_id'], resource=r_id)
    if rc.count() > 0:
        rc.delete()
    return redirect(request.META['HTTP_REFERER'])

def nodes(request):
    nodes = Node.objects.all()
    for n in nodes:
        n.follow_count = NodeFollow.objects.filter(node=n.id).count()
        if 'user_id' in request.session and NodeFollow.objects.filter(user=request.session['user_id'], node=n.id).count() > 0:
            n.is_followed = True
        else:
            n.is_followed = False
    return render(request, 'resources/nodes.html', {'nodes': nodes})

def all_nodes(request):
    node_types = NodeType.objects.all()
    for nt in node_types:
        nt.nodes = Node.objects.filter(type=nt.id)
        for n in nt.nodes:
            n.follow_count = NodeFollow.objects.filter(node=n.id).count()
            if 'user_id' in request.session and NodeFollow.objects.filter(user=request.session['user_id'], node=n.id).count() > 0:
                n.is_followed = True
            else:
                n.is_followed = False
    return render(request, 'resources/all_nodes.html', {'node_types': node_types})

def node(request, n_id):
    node = Node.objects.get(id=n_id)
    follow_count = NodeFollow.objects.filter(node=n_id).count()
    if 'user_id' in request.session and NodeFollow.objects.filter(user=request.session['user_id'], node=n_id).count() > 0:
        is_followed = True
    else:
        is_followed = False

    # order = request.GET['order']
    resource_types = ResourceType.objects.filter(node=n_id)
    for rt in resource_types:
        rt.resources = Resource.objects.filter(node=n_id, type=rt.id).order_by('-create_time')
        for r in rt.resources:
            r.collect_count = ResourceCollect.objects.filter(resource=r.id).count()
            if 'user_id' in request.session and ResourceCollect.objects.filter(user=request.session['user_id'], resource=r.id).count() > 0:
                r.is_collected = True
            else:
                r.is_collected = False
    return render(request, 'resources/node.html', {'node': node, 'resource_types': resource_types, 'is_followed': is_followed, 'follow_count': follow_count})

def follow_node(request, n_id):
    u = User.objects.get(name=request.session['user'])
    n = Node.objects.get(id=n_id)
    if NodeFollow.objects.filter(user=u.id, node=n.id).count() == 0:
        NodeFollow.objects.create(user=u, node=n)
    return redirect(request.META['HTTP_REFERER'])

def disfollow_node(request, n_id):
    user_id = request.session['user_id']
    nf = NodeFollow.objects.filter(user=user_id, node=n_id)
    if nf.count() > 0:
        nf.delete()
    return redirect(request.META['HTTP_REFERER'])
