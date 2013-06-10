from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm
from rsuser.models import RsUser, Stars


class LoginForm(forms.Form):
    username = forms.EmailField(label=(u'User Name'))
    password = forms.CharField(label=(u'Password'), widget=forms.PasswordInput(render_value=False))
    

class AwardingForm(forms.Form):
    #usernameg     = forms.EmailField(label=(u'User Name Giver'))
    usernamer     = forms.EmailField(label=(u'User Name Receiver'))
    awardingstars = forms.IntegerField()


