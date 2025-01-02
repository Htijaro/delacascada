from django import forms
from AppInventario.models import Producto

class FormProducto(forms.ModelForm):
    fechaactualizacioninv = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    cantidadproducto = forms.IntegerField(
        label='Cantidad Producto', min_value=1, initial=1,
        widget=forms.NumberInput(attrs={'oninput': 'updatePrice();'})
    )
    precioproductoinv = forms.DecimalField(
        label='Precio Producto', 
        decimal_places=2,
        widget=forms.NumberInput()
    )
    cantidad = forms.IntegerField(
        label='Cantidad', min_value=1, initial=1,
        widget=forms.NumberInput(attrs={'oninput': 'updatePrice();'})
    )
    
    total = forms.DecimalField(
        label='Total', decimal_places=2, required=False,
        widget=forms.NumberInput(attrs={'readonly': 'readonly'})
    )
    
    class Meta:
        model = Producto
        fields = ['nombreproductoinv', 'cantidadproducto', 'precioproductoinv', 'fechaactualizacioninv', 'otrosdatos', 'presentacion','cantidad', 'foto_producto']
        widgets = {
            'fechaactualizacioninv': forms.DateInput(attrs={'type': 'date'}),
        }
        
    def clean(self):
        cleaned_data = super().clean()
        cantidad = cleaned_data.get('cantidadproducto')
        precio = cleaned_data.get('precioproductoinv')
        
        if cantidad and precio:
            total = precio * cantidad
            cleaned_data['total'] = total
        else:
            cleaned_data['total'] = 0
        
        return cleaned_data
