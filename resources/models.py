from django.db import models
from users.models import User

class Node(models.Model):
    parent_node = models.ForeignKey('self', null=True, blank=True)
    title = models.CharField(max_length=200)
    desc = models.TextField()
    image_url = models.CharField(max_length=200)
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title

class Resource(models.Model):
    node = models.ForeignKey(Node)
    creator = models.ForeignKey(User)
    title = models.CharField(max_length=100)
    type = models.CharField(max_length=50)
    url = models.CharField(max_length=200)
    desc = models.CharField(max_length=200)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.title