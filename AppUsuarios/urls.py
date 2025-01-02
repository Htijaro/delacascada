from django.contrib import admin
from django.urls import path
from AppUsuarios import views
from django.conf import settings
from django.conf.urls.static import static
from django.views.defaults import server_error, page_not_found



urlpatterns = [
    path('', views.listarUsuarios, name='listarUsuarios'),

]

# Configuración para servir archivos estáticos en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# Manejo de errores personalizado
#handler500 = 'cascada.views.server_error'  # Vista para errores de servidor (500)