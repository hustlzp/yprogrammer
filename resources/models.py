from django.db import models

class Node(models.Model):
    parent_node = models.IntegerField()
    title = models.CharField(max_length=200)
    desc = models.TextField()
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title

class Resource(models.Model):
    node = models.ForeignKey(Node)
    title = models.CharField(max_length=100)
    type = models.CharField(max_length=50)
    url = models.CharField(max_length=200)
    content = models.TextField()
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title