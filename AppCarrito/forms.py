from decimal import Decimal
from django.conf import settings
from AppInventario.models import Producto

class Carrito:
    def __init__(self, request):
        self.session = request.session
        self.carrito = self.session.get('carrito', {})

    def agregar(self, producto):
        producto_id = str(producto.idproducto)
        if producto_id not in self.carrito:
            self.carrito[producto_id] = {
                'nombre': producto.nombreproductoinv,
                'precio': producto.precioproductoinv,
                'cantidad': 1,
                'foto_producto': producto.foto_producto.url if producto.foto_producto else None
            }
        else:
            self.carrito[producto_id]['cantidad'] += 1
        self.guardar_carrito()

    def actualizar(self, producto, cantidad):
        producto_id = str(producto.idproducto)
        if producto_id in self.carrito:
            self.carrito[producto_id]['cantidad'] = cantidad
        self.guardar_carrito()  # Guarda los cambios en el carrito

    def eliminar(self, producto):
        producto_id = str(producto.idproducto)
        if producto_id in self.carrito:
            del self.carrito[producto_id]
            self.guardar_carrito()

    def guardar_carrito(self):
        self.session['carrito'] = self.carrito
        self.session.modified = True

    def calcular_total_carrito(self):
        total = 0
        for item in self.carrito.values():
            precio = item['precio']
            cantidad = item['cantidad']
            # Asegúrate de convertir el precio a entero o flotante antes de sumar
            total += int(precio) * cantidad  # O usa float(precio) si los precios tienen decimales
        return total

    def obtener_carrito(self):
        return self.carrito
