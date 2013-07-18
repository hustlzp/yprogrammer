from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),

    # resources
    url(r'^', include('resources.urls')),

    # users
    url(r'^', include('users.urls')),

    # admin doc
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # admin
    url(r'^admin/', include(admin.site.urls)),
)
