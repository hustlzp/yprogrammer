from django.contrib import admin
from resources.models import Resource, Node, NodeType

class ResourceInline(admin.StackedInline):
    model = Resource
    extra = 3

class NodeAdmin(admin.ModelAdmin):
    fields = ['type', 'title', 'image_url', 'desc', 'create_time']
    inlines = [ResourceInline]

admin.site.register(Node, NodeAdmin)
admin.site.register(Resource)
admin.site.register(NodeType)
