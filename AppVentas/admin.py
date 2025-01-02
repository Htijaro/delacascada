from import_export.admin import ImportExportModelAdmin
from . import models
from import_export import resources
from django.contrib import admin
from .models import Pedidos, Ventas, Domicilio


#REPORTES PEDIDOS

class PedidosResources(resources.ModelResource):
    class Meta:
        model = Pedidos
        fields = ('idpedido','usuario_pedido', 'direccionpedido', 'telefonopedido', 'fechapedido', 'horapedido', 'estadopedido', 'observacion')

@admin.register(Pedidos)
class PedidosAdmin(ImportExportModelAdmin):
    resource_class = PedidosResources
    list_display = ('idpedido', 'usuario_pedido', 'direccionpedido', 'telefonopedido', 'fechapedido', 'horapedido', 'estadopedido', 'observacion')
    search_fields = ('idpedido',)












#REPORTES VENTAS
    
class VentasResources(resources.ModelResource):
    fields = (
        'idfactura',
        'fechaventa',
        'horaventa',
        'nombre_usuario',
        'idpedido',
        'idventa',  
    )
    
    class Meta:
        model = Ventas        
        
@admin.register(Ventas)
class VentasAdmin(ImportExportModelAdmin):
    resource_class = VentasResources
    list_display = (
        'idfactura',
        'fechaventa',
        'horaventa',
        'nombre_usuario',
        'idpedido',
        'idventa',
   
    )
    #
    def pedidos(self, obj):
        #toda la operacion
        return 'Reporte de pedidos'
    
    search_fields = ('idpedido',)


#REPORTES DOMICILIOS


class DomicilioResources(resources.ModelResource):
    fields = (
        'iddomicilio',
        'fechadomicilio',
        'horadomicilio',
        'estadodomicilio',

    )
    
    class Meta:
        model = Domicilio        
        
@admin.register(Domicilio)
class DomicilioAdmin(ImportExportModelAdmin):
    resource_class = DomicilioResources
    list_display = (
        'iddomicilio',
        'fechadomicilio',
        'horadomicilio',
        'estadodomicilio',
   
    )
    #
    def pedidos(self, obj):
        #toda la operacion
        return 'Reporte de pedidos'
    
    search_fields = ('idpedido',)







# Register your models here.
