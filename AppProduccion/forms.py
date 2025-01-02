from django import forms
from .models import Fichaproduccion, Controlcalidad

# Se crean los formularios para el módulo de producción.


class FormControlcalidad(forms.ModelForm):
    
    class Meta:
        model = Controlcalidad
        #fields = ['idcontrolcalidad','catacioncalidad','registrocontrocalidadl','hallazgoscalidad','fechavencimiento',]
        fields = '__all__'


      
        
class FormFichaproduccion(forms.ModelForm):
    
    class Meta:
        model = Fichaproduccion
        #fields = ['idfichaproduccion','idproducto','cantidadproduccion','medirclorado','medirph','filtrado','microfiltrado','empaque','fecha_produccion','hora_produccion','num_lote_produccion','estadoproduccion',]
        fields = '__all__'