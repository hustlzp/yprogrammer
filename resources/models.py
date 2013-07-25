#-*- coding: UTF-8 -*-
from django.db import models
from users.models import User

class NodeType(models.Model):
    type = models.CharField(max_length=50)

    def __unicode__(self):
        return self.type

class Node(models.Model):
    type = models.ForeignKey(NodeType, null=True, blank=True)
    title = models.CharField(max_length=200)
    desc = models.TextField()
    image_url = models.CharField(max_length=200)
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title

class ResourceType(models.Model):
    node = models.ForeignKey(Node)
    type = models.CharField(max_length=100)

    def __unicode__(self):
        return '%s/%s' % (self.node.title, self.type)

class Resource(models.Model):
    node = models.ForeignKey(Node)
    creator = models.ForeignKey(User)
    title = models.CharField(max_length=100)
    type = models.ForeignKey(ResourceType)
    url = models.CharField(max_length=200)
    desc = models.CharField(max_length=200, blank=True)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.title

# a user follow a node
class NodeFollow(models.Model):
    user = models.ForeignKey(User)
    node = models.ForeignKey(Node, related_name='follows')
    order = models.IntegerField(blank=True, default=0)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return '%s follow %s' % (self.user, self.node)

# a user collect a resource
class ResourceCollect(models.Model):
    user = models.ForeignKey(User)
    resource = models.ForeignKey(Resource, related_name='collects')
    order = models.IntegerField(blank=True, default=0)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return '%s collect %s' % (self.user, self.resource)

# a user comment on a resource
class ResourceComment(models.Model):
    user = models.ForeignKey(User)
    resource = models.ForeignKey(Resource)
    comment = models.TextField()
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.comment
