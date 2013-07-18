from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    avatar_url = models.CharField(max_length=200)
    blog = models.CharField(max_length=100, blank=True)
    location = models.CharField(max_length=200, blank=True)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.name
