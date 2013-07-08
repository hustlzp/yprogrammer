from django.conf.urls import patterns, url
from users import views

urlpatterns = patterns('',
    url(r'^login/github/$', views.login, name='login'),
    url(r'u/(?P<username>[\w\.@+]+)', views.user, name='user')
)