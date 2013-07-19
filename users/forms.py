from django import forms

class UserForm(forms.Form):
	name = forms.CharField()
	avatar_url = forms.URLField()
	email = forms.EmailField()
