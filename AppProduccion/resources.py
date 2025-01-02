from import_export import resources
from AppProduccion.models import Fichaproduccion, Controlcalidad
       
# Se generan los campos para la creación de reportes de producción.

        
class ReporteFichaproduccion(resources.ModelResource):
    class Meta:
        model = Fichaproduccion
        # Especifica los campos que deseas incluir en el reporte de Excel
        fields = ['idfichaproduccion','idproducto','cantidadproduccion','medirclorado','fecha_produccion','hora_produccion','medirph','filtrado','microfiltrado','empaque','num_lote_produccion','estadoproduccion',]


class ReporteControlcalidad(resources.ModelResource):
    
    class Meta:
        model = Controlcalidad
        fields = ['idcontrolcalidad','catacioncalidad','registrocontrocalidadl','hallazgoscalidad','fechavencimiento',]
