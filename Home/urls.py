"""
URL configuration for Home project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from AppVentas import views 
from django.conf import settings
from django.conf.urls.static import static
from . import views

# Se crean las rutas para la aplicación principal. 

urlpatterns = [

    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('menu/', views.home, name='menu'),
    path('signup/', views.signup, name='signup'),
    path('signin/', views.signin, name='signin'),
    path('login/', views.login_page, name='login'),
    path('signout/', views.signout, name='signout'),
    path('profile/', views.profile, name='profile'),
    path('AppVentas/', include('AppVentas.urls')),
    path('AppCarrito/', include('AppCarrito.urls')),
    path('AppInventario/', include('AppInventario.urls')),
    path('AppProduccion/', include('AppProduccion.urls')),
    path('AppUsuarios/', include('AppUsuarios.urls')),
    path('error404/', views.error404_view, name='error404'),
    path('error500/', views.error500_view, name='error500'),
      
]

# Configuración para servir archivos estáticos en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# Manejo de errores personalizado
# urlpatterns += [
#     path('404/', server_error, {'exception': Exception('Not Found')}),
#     path('404/', page_not_found, {'exception': Exception('Not Found')}),
# ]
