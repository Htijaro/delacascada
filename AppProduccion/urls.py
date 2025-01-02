from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

# Se crean las rutas para el acceso al módulo de prodcción.


urlpatterns = [
    path('', views.dashproduccion, name='dashproduccion'),
    path('FormControlcalidad/', views.controlcalidad, name='controlcalidad'),
    path('FormFichaproduccion/', views.fichaproduccion, name='fichaproduccion'),
    path('editarFichaproduccion/<id>/', views.editarFichaproduccion, name='editar_fichaproduccion'),
    path('eliminarFichaproduccion/<id>/', views.eliminarFichaproduccion, name='eliminar_fichaproduccion'),
    path('exportar_excel_produccion/', views.exportar_excel_produccion, name='exportar_excel_produccion'),
    path('eliminarControlcalidad/<id>/', views.eliminarControlcalidad, name='eliminar_Controlcalidad'),
    path('editarControlcalidad/<id>/', views.editarControlcalidad, name='editar_Controlcalidad'),
    path('exportar_excel_Controlcalidad/', views.exportar_excel_Controlcalidad, name='exportar_excel_Controlcalidad'),
    path('ProduccionCalidad/', views.produccion_calidad, name='produccion_calidad'),
    path('ProduccionMantenimiento/', views.produccion_mantenimiento, name='produccion_mantenimiento'),
    path('ProduccionMateriasP/', views.produccion_materiasP, name='produccion_materiasP'),
]

# Configuración para servir archivos estáticos en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# Manejo de errores personalizado
#handler500 = 'cascada.views.server_error'  # Vista para errores de servidor (500)
#handler404 = 'cascada.views.page_not_found'  # Vista para errores 404 (página no encontrada)
