from django.conf.urls import patterns, url
from resources import views

urlpatterns = patterns('',
    # resource
    url(r'^$', views.resources, name='resources'),
    url(r'^resource/(?P<r_id>\d+)/$', views.resource, name='resource'),
    # url(r'^resource/(?P<r_id>\d+)/collect/$', views.collect_resource, name='collect_resource'),

    # node
    url(r'^nodes/$', views.nodes, name='nodes'),
    url(r'^node/(?P<n_id>\d+)/$', views.node, name='node'),
    url(r'^node/(?P<n_id>\d+)/follow/$', views.follow_node, name='follow_node'),
    url(r'^node/(?P<n_id>\d+)/disfollow/$', views.disfollow_node, name='disfollow_node')   
)
