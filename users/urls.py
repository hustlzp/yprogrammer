from django.conf.urls import patterns, url
from users import views

urlpatterns = patterns('',
    url(r'^signin/github/$', views.signin, name='signin'),
    url(r'^signout/$', views.signout, name='signout'),
    url(r'u/(?P<username>[\w\.@+]+)/$', views.user, name='user'),
    url(r'^$', views.user_nav, name='user_nav')
    # url(r'u/(?P<username>[\w\.@+]+)/nav/$', views.user_nav, name='user_nav')
)