from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import Usuarios

class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = Usuarios
        fields = ('first_name','last_name','username','direccion', 'telefono','email')
