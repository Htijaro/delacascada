from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.views.decorators.cache import never_cache
from django.utils.decorators import method_decorator
from django.utils.cache import add_never_cache_headers

from AppVentas.models import Pedidos, Ventas, Domicilio
from AppVentas.forms import FormDomicilio, FormPedido
from AppProduccion.models import Controlcalidad, Fichaproduccion
from AppProduccion.forms import FormControlcalidad, FormFichaproduccion
from AppInventario.models import Producto
from AppUsuarios.forms import CustomUserCreationForm
from AppUsuarios.backends import EmailBackend

User = get_user_model()

# Middleware to prevent caching on all responses
def no_cache_middleware(get_response):
    def middleware(request):
        response = get_response(request)
        add_never_cache_headers(response)
        return response
    return middleware

# Vistas generales
@never_cache
def index(request):
    return render(request, 'index.html', {'message': 'Ingreso a De La Cascada'})

@never_cache
def login_page(request):
    return render(request, 'login.html')

@never_cache
def admin_redirect(request):
    return HttpResponseRedirect('/admin/login/?next=/admin/')

@login_required
@never_cache
def dashinventario(request):
    return render(request, 'inventario.html')

def error500_view(request):
    return render(request, 'error500.html')

def error404_view(request):
    return render(request, 'error404.html')

@never_cache
def home(request): 
    return render(request, 'menu.html')

# Vistas para SIGNIN, SIGNOUT y SIGNUP

@never_cache
def signup(request):
    if request.user.is_authenticated:
        return redirect('/')
    
    form = CustomUserCreationForm(request.POST or None)
    
    if form.is_valid():
        user = form.save()

        backend = 'AppUsuarios.backends.EmailBackend'
        login(request, user, backend=backend)

        return redirect('/')
    
    return render(request, 'signup.html', {'form': form})

@never_cache
def signin(request):
    if request.user.is_authenticated:
        return redirect('index')
    
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = authenticate(request, username=email, password=password)
        
        if user is not None:
            login(request, user)

            if email in ['auxiliarventas@delacascada.com', 'asistenteventas@delacascada.com']:
                return redirect('dashventas')
            
            if email in ['administrador@delacascada.com', 'asistenteadministrativo@delacascada.com']:
                return redirect('dashinventario')
            
            if email == 'jefeproduccion@delacascada.com':
                return redirect('dashproduccion')
            
            return redirect('Tienda') 
        
        else:
            msg = 'Error Login'
            form = AuthenticationForm(request.POST)
            return render(request, 'signin.html', {'form': form, 'msg': msg})
    else:
        form = AuthenticationForm()
        return render(request, 'signin.html', {'form': form})

@never_cache
def signout(request):
    logout(request)
    response = redirect('index')
    
    # Disable caching for this response
    response['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response['Pragma'] = 'no-cache'
    response['Expires'] = '0'
    
    return response

@login_required
@never_cache
def profile(request):
    return render(request, 'profile.html')
