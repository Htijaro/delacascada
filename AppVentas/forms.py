from django import forms
from .models import Pedidos, Domicilio, Ventas
from AppProduccion.models import Producto
from AppInventario.models import Producto
from .models import Factura

# Se crean los formularios de el módulo de ventas.

#Pedidos:

class FormPedido(forms.ModelForm):
    producto = forms.ModelChoiceField(
        queryset=Producto.objects.all(), label='Producto',
        widget=forms.Select(attrs={'onchange': 'updatePrice();'})
    )
    cantidad = forms.IntegerField(
        label='Cantidad', min_value=1, initial=1,
        widget=forms.NumberInput(attrs={'oninput': 'updatePrice();'})
    )
    precioproductoinv = forms.CharField(
        label='Precio Producto', required=False,
        widget=forms.TextInput(attrs={'readonly': 'readonly'})
    )
    total = forms.DecimalField(
        label='Total', decimal_places=2, required=False,
        widget=forms.NumberInput(attrs={'readonly': 'readonly'})
    )
    
    class Meta:
        model = Pedidos
        fields = ['usuario_pedido', 'direccionpedido', 'telefonopedido', 'fechapedido', 'horapedido', 'estadopedido',
                  'observacion', 'producto', 'cantidad', 'precioproductoinv', 'total']
        exclude = ['fechapedido','horapedido'] 
    
    def clean(self):
        cleaned_data = super().clean()
        producto = cleaned_data.get('producto')
        cantidad = cleaned_data.get('cantidad')

        if producto and cantidad:
            precioproductoinv = float(producto.precioproductoinv)
            total = precioproductoinv * cantidad
            cleaned_data['precioproductoinv'] = precioproductoinv
            cleaned_data['total'] = total
        else:
            # Handle the case where either producto or cantidad is None
            cleaned_data['precioproductoinv'] = 0
            cleaned_data['total'] = 0
        
        return cleaned_data
    


# Ventas:

class FormVenta(forms.ModelForm):
    
    class Meta:
        model = Ventas
        fields = ['idfactura', 'fechaventa', 'horaventa', 'nombre_usuario', 'idpedido']
        exclude = ['fechaventa','horaventa'] 





    
class FormDomicilio(forms.ModelForm):
    
    class Meta:
        model = Domicilio
        fields = ['fechadomicilio', 'horadomicilio', 'estadodomicilio', 'idpedido']
        exclude = ['fechadomicilio','horadomicilio'] 


class FacturaForm(forms.ModelForm):
    class Meta:
        model = Factura
        fields = ['id_cliente']