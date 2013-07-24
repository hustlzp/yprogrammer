#-*- coding: UTF-8 -*-
from django import template
from resources.models import NodeFollow, ResourceCollect
from django.utils.timesince import timesince

register = template.Library()

# check if a node is followed by the current user
@register.filter
def is_followed(node, user):
    """Check if a node is followed by a user."""
    follow_count = NodeFollow.objects.filter(node=node, user=user).count()
    return True if follow_count >= 1 else False

# check if a resource is collected by the current user
@register.filter
def is_collected(resource, user):
    """Check if a resource is collected by a user."""
    collect_count = ResourceCollect.objects.filter(resource=resource, user=user).count()
    return True if collect_count >= 1 else False

@register.filter
def ago(date):
    ago = timesince(date)
    return ago.split(",")[0].replace(' ', '')