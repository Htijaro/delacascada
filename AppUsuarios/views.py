from django.shortcuts import render
from . models import Usuarios
from django.views.decorators.cache import never_cache

# Se crean las vistas para el módulo de ventas. 

@never_cache
def listarUsuarios(request):
    usuarios = Usuarios.objects.all()
    return render(request, 'listarUsuarios.html', {'usuarios':usuarios})

# Create your views here.
