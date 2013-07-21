from django import template
from resources.models import NodeFollow, ResourceCollect

register = template.Library()

@register.filter
def is_followed(node, user):
    """Check if a node is followed by a user."""
    try:
        NodeFollow.objects.get(node=node, user=user)
        return True
    except NodeFollow.DoesNotExist:
        return False

@register.filter
def is_collected(resource, user):
    """Check if a resource is collected by a user."""
    try:
        ResourceCollect.objects.get(resource=resource, user=user)
        return True
    except ResourceCollect.DoesNotExist:
        return False
