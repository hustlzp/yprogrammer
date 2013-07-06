from django.contrib import admin
from resources.models import Resource
from resources.models import Node

class ResourceInline(admin.StackedInline):
    model = Resource
    extra = 3

class NodeAdmin(admin.ModelAdmin):
    fields = ['parent_node', 'title', 'desc', 'create_time']
    inlines = [ResourceInline]

admin.site.register(Node, NodeAdmin)
