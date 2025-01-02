from django.db import models
from datetime import datetime
from PIL import Image
from AppInventario.models import Producto


# Creación de todos los modelos del módulo de ventas.


Estado_Pedido = [

    ('Enviado', 'Enviado'),
    ('Pendiente', 'Pendiente'),
    ('Cancelado', 'Cancelado'),

    ]

class Pedidos(models.Model): 
    idpedido = models.BigAutoField(primary_key=True)
    usuario_pedido = models.CharField(max_length=20, blank=True, null=True)
    direccionpedido = models.CharField(max_length=50, blank=True, null=True)
    telefonopedido = models.CharField(max_length=20, blank=True, null=True)
    fechapedido = models.DateField(auto_now_add=True)
    horapedido = models.TimeField(auto_now_add=True)
    estadopedido = models.CharField(max_length=20, choices=Estado_Pedido, null=True)
    observacion = models.CharField(max_length=200, blank=True, null=True)
    producto = models.CharField(max_length=20, blank=True, null=True)
    cantidad = models.IntegerField(blank=True, null=True)
    precioproductoinv = models.CharField(max_length=20, blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return f"Pedido {self.idpedido} - {self.usuario_pedido}"

    class Meta:
        verbose_name_plural = 'Pedidos'
        verbose_name = 'Pedido'
        db_table = 'pedidos'


Estado_Domicilio = [

    ('Entregado', 'Entregado'),
    ('Pendiente', 'Pendiente'),
    ('Devuelto', 'Devuelto'),
    ('Cancelado', 'Cancelado'),
    ]

class Domicilio(models.Model):
    iddomicilio = models.BigAutoField(primary_key=True)
    fechadomicilio = models.DateField(auto_now_add=True)
    horadomicilio = models.TimeField(auto_now_add=True)
    estadodomicilio = models.CharField(max_length=10, choices=Estado_Domicilio, null=True)
    idpedido = models.ForeignKey(Pedidos, on_delete=models.CASCADE, verbose_name='ID Pedido', null=True)

    def __str__(self):
        return f"Domicilio {self.iddomicilio}"

    class Meta:
        verbose_name_plural = 'Domicilios'
        verbose_name = 'Domicilio'
        db_table = 'domicilio'



class Ventas(models.Model):
    idventa = models.BigAutoField(primary_key=True)  
    idfactura = models.CharField( verbose_name='Id Factura', max_length=45, blank=True, null=True)  
    fechaventa = models.DateField(verbose_name='Fecha Venta', auto_now_add=True)  
    horaventa = models.TimeField( verbose_name='Hora Venta', max_length=10, blank=True, null=True, auto_now_add=True)  
    nombre_usuario = models.CharField(verbose_name='Nombre Usuario', max_length=45, blank=True, null=True) 
    idpedido = models.ForeignKey(Pedidos, on_delete=models.CASCADE)  

    def __str__(self):
        return self.nombre_usuario

    class Meta:
        verbose_name = 'Ventas'
        verbose_name_plural = 'Venta'
        db_table = 'ventas'

class Factura(models.Model):
    id_factura = models.AutoField(primary_key=True)
    fecha = models.DateTimeField(auto_now_add=True)
    id_cliente = models.CharField(max_length=20)

    def __str__(self):
        return f'Factura {self.id_factura} - Cliente {self.id_cliente}'
