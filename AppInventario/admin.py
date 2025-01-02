from import_export.admin import ImportExportModelAdmin
from import_export import resources
from django.contrib import admin
from .models import Controlinventario, Insumos, Entradas, Salida, Producto, Proveedores


#REPORTES CONTROLINVENTARIO

class ControlinventarioResources(resources.ModelResource):
    fields = (
        'almacenajeproductos',
        'solicitudcompra',
        'idproducto',
        'idsalida',
        'identrada',
        'idinsumo',  
    )
    
    class Meta:
        model = Controlinventario

@admin.register(Controlinventario)
class ControlinventarioAdmin(ImportExportModelAdmin):
    list_display = (
        'idinsumo', 
        'almacenajeproductos',
        'solicitudcompra',
        'idproducto',
        'idsalida',
        'identrada',

    )
    search_fields = ('idproducto',)



#REPORTES PRODUCTOS


class ProductoResources(resources.ModelResource):
    fields = (
        'idproducto',
        'nombreproductoinv',
        'cantidadproducto',
        'precioproductoinv',
        'fechaactualizacioninv',
        'otrosdatos', 
        'presentacion', 
        'foto_producto', 
         
    )
    
    class Meta:
        model = Producto

@admin.register(Producto)
class ProductoAdmin(ImportExportModelAdmin):
    list_display = (
        'idproducto',
        'nombreproductoinv',
        'cantidadproducto',
        'precioproductoinv',
        'fechaactualizacioninv',
        'presentacion', 
        'foto_producto',

    )
    search_fields = ('idproducto',)
    
    
#REPORTES INSUMOS 



class InsumosResources(resources.ModelResource):
    fields = (
        'idinsumo',
        'nombreinsumo',
        'cantidadinsumo',
        'idestadoinsumo',
        'idproveedor',
   
    )
    
    class Meta:
        model = Insumos

@admin.register(Insumos)
class InsumosAdmin(ImportExportModelAdmin):
    list_display = (
        'idinsumo',
        'nombreinsumo',
        'cantidadinsumo',
        'idestadoinsumo',
        'idproveedor',

    )
    search_fields = ('idinsumos',)
    
    
# REPORTES ENTRADAS


class EntradasResources(resources.ModelResource):
    fields = (
        'identrada',
        'nombreinsumoentrada',
        'cantidadinsumoentrada',
        'fechainsumoentrada',
        'horainsumoentrada',
   
    )
    
    class Meta:
        model = Entradas

@admin.register(Entradas)
class EntradasAdmin(ImportExportModelAdmin):
    list_display = (
        'identrada',
        'nombreinsumoentrada',
        'cantidadinsumoentrada',
        'fechainsumoentrada',
        'horainsumoentrada',

    )
    search_fields = ('identradas',)
    
    
# REPORTES SALIDAS

class SalidaResources(resources.ModelResource):
    fields = (
        'idsalida',
        'nombreproductosalida',
        'cantidadproductosalida',
        'fechasalidaproducto',
        'horasalidaproducto',
   
    )
    
    class Meta:
        model = Salida

@admin.register(Salida)
class SalidaAdmin(ImportExportModelAdmin):
    list_display = (
        'idsalida',
        'nombreproductosalida',
        'cantidadproductosalida',
        'fechasalidaproducto',
        'horasalidaproducto',

    )
    search_fields = ('idsalidSalida',)
    
    
    
# REPORTES PROVEEDORES


class ProveedoresResources(resources.ModelResource):
    fields = (
        'idproveedor',
        'num_proveedor',
        'nombreproveedor',
        'emailproveedor',
   
    )
    
    class Meta:
        model = Proveedores

@admin.register(Proveedores)
class ProveedoresAdmin(ImportExportModelAdmin):
    list_display = (
        'idproveedor',
        'num_proveedor',
        'nombreproveedor',
        'emailproveedor',

    )
    search_fields = ('idproveedores',)
    
