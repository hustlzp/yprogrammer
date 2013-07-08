from django.conf.urls import patterns, url
from resources import views

urlpatterns = patterns('',
    url(r'^$', views.resources, name='resources'),
    url(r'^resource/(?P<r_id>\d+)/$', views.resource, name='resource'),
    url(r'^nodes/$', views.nodes, name='nodes'),
    url(r'^node/(?P<n_id>\d+)/$', views.node, name='node')
)
