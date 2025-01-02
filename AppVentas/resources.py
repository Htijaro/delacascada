# en tu_app/resources.py

from import_export import resources
from AppVentas.models import Pedidos

class ReportePedidos(resources.ModelResource):
    class Meta:
        model = Pedidos
        # Especifica los campos que deseas incluir en el reporte de Excel
        fields = ('idpedido','usuario_pedido', 'direccionpedido', 'telefonopedido', 'fechapedido', 'horapedido', 'estadopedido', 'observacion','producto', 'cantidad', 'precio', 'total')


