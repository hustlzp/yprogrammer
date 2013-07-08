from django.db import models

class Node(models.Model):
    parent_node = models.ForeignKey('self', null=True, blank=True)
    # parent_node = models.IntegerField()
    title = models.CharField(max_length=200)
    desc = models.TextField()
    image_url = models.CharField(max_length=200)
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title

class Resource(models.Model):
    node = models.ForeignKey(Node)
    title = models.CharField(max_length=100)
    type = models.CharField(max_length=50)
    url = models.CharField(max_length=200)
    # image_url = models.CharField(max_length=200, blank=True)
    desc = models.CharField(max_length=200)
    # rank = models.FloatField(blank=True, default=0)
    create_time = models.DateTimeField('date')

    def __unicode__(self):
        return self.title