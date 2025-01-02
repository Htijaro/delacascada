from django.contrib import admin
from django.urls import path
from AppVentas import views
from AppInventario.views import exportar_excel_productos
from django.conf import settings
from django.conf.urls.static import static
from django.views.defaults import server_error, page_not_found
from .views import domicilios, form_pedidos, eliminarPedidos
from .views import precio_producto_api

# Se crean las rutas para el acceso al módulo de ventas.
 

urlpatterns = [
    path('', views.dashventas, name='dashventas'),
    path('FormVentas/', views.form_ventas, name='formventas'),
    path('editarVentas/<id>/', views.editarVentas, name='editar_ventas'),
    path('eliminarVentas/<id>/', views.eliminarVentas, name='eliminar_ventas'),
    path('exportar_excel_ventas/', views.exportar_excel_ventas, name='exportar_excel_ventas'),
    path('FormDomicilios/', views.form_domicilios, name='formdomicilios'),
    path('editarDomicilios/<id>/', views.editarDomicilios, name='editar_domicilios'),
    path('eliminarDomicilios/<id>/', views.eliminarDomicilios, name='eliminar_domicilios'),
    path('exportar_excel_domicilios/', views.exportar_excel_domicilios, name='exportar_excel_domicilios'),
    path('FormPedidos/', views.form_pedidos, name='formpedidos'),
    path('editarPedidos/<id>/', views.editarPedidos, name='editar_pedidos'),
    path('eliminarPedidos/<id>/', views.eliminarPedidos, name='eliminar_pedidos'),
    path('exportar_excel_pedidos/', views.exportar_excel_pedidos, name='exportar_excel_pedidos'),
    path('exportar_excel_productos/', exportar_excel_productos, name='exportar_excel_productos'),
    path('api/precio-producto/<int:producto_id>/', views.precio_producto_api, name='precio_producto_api'),
    path('VentasPedidos/', views.ventas_pedidos, name='ventas_pedidos'),
    path('VentasClientes/', views.ventas_clientes, name='ventas_clientes'),
    path('VentasDomicilios/', views.ventas_domicilios, name='ventas_domicilios'),
    path('VentasProductos/', views.ventas_productos, name='ventas_productos'),
    path('crear_factura/', views.crear_factura, name='crear_factura'),
    path('listar_facturas/', views.listar_facturas, name='listar_facturas'),
]

# Configuración para servir archivos estáticos en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# Manejo de errores personalizado
#handler500 = 'cascada.views.server_error'  # Vista para errores de servidor (500)
#handler404 = 'cascada.views.page_not_found'  # Vista para errores 404 (página no encontrada)

