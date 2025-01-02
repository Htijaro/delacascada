from django.db import models
from PIL import Image
from datetime import datetime

# Se crean todos los modelos del módulo de inventario.

class Producto(models.Model):
    idproducto = models.BigAutoField(primary_key=True)  # Field name made lowercase.
    nombreproductoinv = models.CharField(verbose_name='NombreProductoInv', max_length=100, blank=True, null=True)  # Field name made lowercase.
    cantidadproducto = models.IntegerField(verbose_name='CantidadProducto', blank=True, null=True)  # Field name made lowercase.
    precioproductoinv = models.IntegerField(verbose_name='Precioproductoinv', blank=True, null=True)
    fechaactualizacioninv = models.DateField(verbose_name='FechaActualizacionInv', max_length=20, blank=True, null=True)  # Field name made lowercase.
    otrosdatos = models.CharField(verbose_name='OtrosDatos', max_length=100, blank=True, null=True)  # Field name made lowercase.
    presentacion = models.CharField(verbose_name='Presentacion', max_length=50, blank=True, null=True)  # Field name made lowercase.
    foto_producto = models.ImageField(upload_to='media/', null=True, blank=True)
    foto_producto = models.ImageField(upload_to='productos/', blank=True, null=True)

    def __str__(self):
        return self.nombreproductoinv

    class Meta:
        verbose_name = 'Productos'
        verbose_name_plural = 'Producto'
        db_table = 'producto'






class Salida(models.Model):
    idsalida = models.BigAutoField(verbose_name='IDsalida', primary_key=True)  # Field name made lowercase.
    nombreproductosalida = models.CharField(verbose_name='NombreProductoSalida', max_length=30, blank=True, null=True)  # Field name made lowercase.
    cantidadproductosalida = models.IntegerField(verbose_name='CantidadProductoSalida', blank=True, null=True)  # Field name made lowercase.
    fechasalidaproducto = models.DateField(verbose_name='FechaSalidaProducto', max_length=10, blank=True, null=True)  # Field name made lowercase.
    horasalidaproducto = models.TimeField(verbose_name='HoraSalidaProducto', max_length=45, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.nombreproductosalida

    class Meta:
        verbose_name = 'Salidas'
        verbose_name_plural = 'Salida'
        db_table = 'salida'



class Proveedores(models.Model):
    idproveedor = models.BigAutoField(verbose_name='IDProveedores', primary_key=True)  # Field name made lowercase.
    num_proveedor = models.IntegerField(verbose_name='Número Proveedor', unique=True, null=True)
    nombreproveedor = models.CharField(verbose_name='NombreProveedor', max_length=50, blank=True, null=True)  # Field name made lowercase.
    emailproveedor = models.CharField(verbose_name='EmailProveedor', max_length=50, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.nombreproveedor

    class Meta:
        verbose_name = 'Proveedores'
        verbose_name_plural = 'Proveedor'
        db_table = 'proveedores'



Estado_Insumo = [
    ('Disponible', 'Disponible'),
    ('Agotado', 'Agotado'),
    ]




class Insumos(models.Model):
    idinsumo = models.BigAutoField(verbose_name='IDInsumos', primary_key=True)  # Field name made lowercase.
    nombreinsumo = models.CharField(verbose_name='NombreInsumo', max_length=30, blank=True, null=True)  # Field name made lowercase.
    cantidadinsumo = models.IntegerField(verbose_name='CantidadInsumo', blank=True, null=True)  # Field name made lowercase.
    idestadoinsumo = models.BooleanField(choices=Estado_Insumo, help_text='Seleccione el Estado del Insumo', null=True)  # Field name made lowercase.
    idproveedor = models.ForeignKey(Proveedores, models.CASCADE, verbose_name='IDProveedor', null=True)  # Field name made lowercase.

    def __str__(self):
        return self.nombreinsumo

    class Meta:
        verbose_name = 'Insumos'
        verbose_name_plural = 'Insumo'
        db_table = 'insumos'




class Entradas(models.Model):
    identrada = models.BigAutoField(verbose_name='IDentradas', primary_key=True)  # Field name made lowercase.
    nombreinsumoentrada = models.CharField(verbose_name='NombreInsumoEntrada', max_length=50, blank=True, null=True)  # Field name made lowercase.
    cantidadinsumoentrada = models.IntegerField(verbose_name='CantidadInsumoEntrada', blank=True, null=True)  # Field name made lowercase.
    fechainsumoentrada = models.DateField(verbose_name='FechaInsumoEntrada', max_length=20, blank=True, null=True)  # Field name made lowercase.
    horainsumoentrada = models.TimeField(verbose_name='HoraInsumoEntrada', max_length=20, blank=True, null=True)  # Field name made lowercase.
    idinsumo = models.ForeignKey(Insumos, models.CASCADE, verbose_name='IDProveedor', null=True)  # Field name made lowercase.

    def __str__(self):
        return self.nombreinsumoentrada

    class Meta:
        verbose_name = 'Entradas'
        verbose_name_plural = 'Entrada'
        db_table = 'entradas'






Almacenaje_Productos = [

    ('Bodega1','Bodega1'),
    ('Bodega2','Bodega2'),
    ('Bodega3', 'Bodega3'),


    ]



class Controlinventario(models.Model):
    idinventario = models.BigAutoField(verbose_name='IDInventario', primary_key=True)  # Field name made lowercase.
    almacenajeproductos = models.CharField(verbose_name='AlmacenajeProductos', max_length=50, choices=Almacenaje_Productos, help_text='Seleccione la ubicación de los productos', blank=True, null=True)  # Field name made lowercase.
    solicitudcompra = models.CharField(verbose_name='SolicitudCompra', max_length=50, blank=True, null=True)  # Field name made lowercase.
    idproducto = models.ForeignKey(Producto, models.CASCADE, verbose_name='IDProducto')  # Field name made lowercase.
    idsalida = models.ForeignKey(Salida, models.CASCADE, verbose_name='IDSalida', blank=True, null=True)  # Field name made lowercase.
    identrada = models.ForeignKey(Entradas, models.CASCADE, verbose_name='IDEntrada', null=True)  # Field name made lowercase.
    idinsumo = models.ForeignKey(Insumos, models.CASCADE, verbose_name='IDInsumo', null=True)  

    def __str__(self):
        return self.almacenajeproductos

    class Meta:
        verbose_name = 'Inventarios'
        verbose_name_plural = 'Inventario'
        db_table = 'controlinventario'
