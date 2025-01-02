from import_export.admin import ImportExportModelAdmin
from import_export import resources
from django.contrib import admin
from .models import Fichaproduccion, Controlcalidad


#REPORTES FICHAPRODUCCIÓN


class FichaproduccionResources(resources.ModelResource):
    fields = (
        'idfichaproduccion',
        'idproducto',
        'cantidadproduccion',
        'medirclorado',
        'medirph',
        'filtrado', 
        'microfiltrado', 
        'empaque', 
        'fecha_produccion', 
        'hora_produccion', 
        'num_lote_produccion', 
        'estadoproduccion', 
        'idcontrolcalidad', 
         
    )
    
    class Meta:
        model = Fichaproduccion

@admin.register(Fichaproduccion)
class FichaproduccionAdmin(ImportExportModelAdmin):
    list_display = (
        'idfichaproduccion',
        'idproducto',
        'cantidadproduccion',
        'medirclorado',
        'medirph',
        'filtrado', 
        'microfiltrado', 
        'empaque', 
        'fecha_produccion', 
        'hora_produccion', 
        'num_lote_produccion', 
        'estadoproduccion', 
        'idcontrolcalidad', 

    )
    search_fields = ('idfichaproduccion',)
    
#REPORTES CONTROLCALIDAD

class ControlcalidadResources(resources.ModelResource):
    fields = (
        'idcontrolcalidad',
        'catacioncalidad',
        'registrocontrocalidadl',
        'hallazgoscalidad',
        'fechavencimiento',  
    )
    
    class Meta:
        model = Controlcalidad

@admin.register(Controlcalidad)
class ControlcalidadAdmin(ImportExportModelAdmin):
    list_display = (
        'idcontrolcalidad',
        'catacioncalidad',
        'registrocontrocalidadl',
        'hallazgoscalidad',
        'fechavencimiento',
    )

#
    def Fichaproduccion(self, obj):
        #toda la operacion
        return 'Reporte fichaproduccion'
    
    search_fields = ('idfichaproduccion',)