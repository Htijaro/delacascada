from django.db import models
from AppInventario.models import Producto

class Cart(models.Model):
    productos = models.ManyToManyField(Producto, through='CartItem')

class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)
    precio=models.IntegerField(verbose_name='Precioproductoinv', blank=True, null=True)
    foto_producto = models.ImageField(upload_to='productos/')
    
    @property
    def total(self):
        return self.cantidad * self.producto.precioproductoinv
