#-*- coding: UTF-8 -*-
from django import forms
from django.contrib import admin
from resources.models import Resource, ResourceType, Node, NodeType

# custom the type select
class ResourceForm(forms.ModelForm):
    class Meta:
        model = Resource

    def __init__(self, *args, **kwargs):
        super(ResourceForm, self).__init__(*args, **kwargs)

        if self.instance.id and self.instance.node:
            types = ResourceType.objects.filter(node=self.instance.node)
            type_field = self.fields['type'].widget
            type_choices = []
            
            if types.count() == 0:
                type_choices.append(('31', '图书'))

            for t in types:
                type_choices.append((t.id, t.type))
            type_field.choices = type_choices

class ResourceInline(admin.StackedInline):
    model = Resource
    form = ResourceForm
    extra = 3

class ResourceTypeInline(admin.StackedInline):
    model = ResourceType
    extra = 3

class NodeAdmin(admin.ModelAdmin):
    fields = ['type', 'title', 'image_url', 'desc']
    inlines = [ResourceTypeInline, ResourceInline]

admin.site.register(Node, NodeAdmin)
admin.site.register(Resource)
admin.site.register(NodeType)
