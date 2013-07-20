from django.conf.urls import patterns, url
from resources import views

urlpatterns = patterns('',
    # resource
    url(r'^resources/$', views.resources, name='resources'),
    url(r'^resource/(?P<r_id>\d+)/$', views.resource, name='resource'),
    url(r'^resource/collect/$', views.collect_resource, name='collect_resource'),
    url(r'^resource/discollect/$', views.discollect_resource, name='discollect_resource'),

    # node
    url(r'^nodes/$', views.my_nodes, name='my_nodes'),
    url(r'^node/(?P<n_id>\d+)/$', views.node, name='node'),
    url(r'^node/follow/$', views.follow_node, name='follow_node'),
    url(r'^node/disfollow/$', views.disfollow_node, name='disfollow_node'), 
    url(r'^nodes/all/$', views.all_nodes, name='all_nodes')
)
