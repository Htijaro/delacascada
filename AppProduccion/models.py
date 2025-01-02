from django.db import models
from datetime import datetime
from PIL import Image
from AppInventario.models import Producto

# Se crean todos los modelos para el módulo de producción.


class Controlcalidad(models.Model):
    idcontrolcalidad = models.BigAutoField(verbose_name='IDControlCalidad', primary_key=True)  # Field name made lowercase.
    catacioncalidad = models.CharField(verbose_name='CatacionCalidad', max_length=30, blank=True, null=True)  # Field name made lowercase.
    registrocontrocalidadl = models.CharField(verbose_name='RegistroControCalidadl', max_length=30, blank=True, null=True)  # Field name made lowercase.
    hallazgoscalidad = models.CharField(verbose_name='HallazgosCalidad', max_length=30, blank=True, null=True)  # Field name made lowercase.
    fechavencimiento = models.DateField(verbose_name='FechaVencimiento', max_length=20, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.fechavencimiento
 
    class Meta:
        verbose_name_plural='Control Calidad'
        verbose_name='Control Calidades'
        db_table = 'controlcalidad'

Estado_Produccion = [

    ('Cumple', 'Cumple'),
    ('No Cumple', 'No Cumple'),

    ]

class Fichaproduccion(models.Model):
    idfichaproduccion = models.BigAutoField(primary_key=True)
    idproducto = models.ForeignKey(Producto, models.CASCADE, verbose_name='IDProducto', blank=True, null=True)  # Field name made lowercase.
    cantidadproduccion = models.IntegerField(blank=True, null=True)
    medirclorado = models.CharField(max_length=20, blank=True, null=True)
    medirph = models.CharField(max_length=20, blank=True, null=True)
    filtrado = models.CharField(max_length=20, blank=True, null=True)
    microfiltrado = models.CharField(max_length=20, blank=True, null=True)
    empaque = models.CharField(max_length=20, blank=True, null=True)
    fecha_produccion = models.DateField(auto_now_add=True, null=True)
    hora_produccion = models.TimeField(auto_now_add=True, null=True)
    num_lote_produccion = models.CharField(max_length=20, blank=True, null=True)
    estadoproduccion = models.CharField(max_length=20, blank=True, null=True)
    idcontrolcalidad = models.ForeignKey(Controlcalidad, models.CASCADE, verbose_name='IDControlCalidad', null=True)  # Field name made lowercase.

    def __srt__(self):
        return self.num_lote_produccion


    class Meta:
        verbose_name_plural='Fichas Producción'
        verbose_name='Ficha Producción'
        db_table = 'fichaproduccion'