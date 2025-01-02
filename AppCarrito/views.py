from django.shortcuts import render, get_object_or_404, redirect
from AppInventario.models import Producto
from .forms import Carrito

def tienda(request):
    productos = Producto.objects.all()  # Recupera todos los productos
    carrito = Carrito(request)
    total_carrito = carrito.calcular_total_carrito()
    items_carrito = carrito.obtener_carrito()

    # Asegurarse de que cada item del carrito contenga la imagen del producto
    for key, value in items_carrito.items():
        producto = Producto.objects.get(idproducto=key)
        value['foto_producto'] = producto.foto_producto.url if producto.foto_producto else None

    return render(request, 'tienda.html', {
        'productos': productos,
        'total_carrito': total_carrito,
        'carrito': items_carrito,  # Pasa el carrito a la plantilla
    })

def add_to_cart(request, producto_id):
    producto = get_object_or_404(Producto, idproducto=producto_id)  # Usar get_object_or_404 para manejar el error
    carrito = Carrito(request)  # Instancia del carrito
    carrito.agregar(producto)  # Usa el método agregar del carrito

    return redirect('Tienda')  # Redirige a la tienda después de agregar el producto

def sub_from_cart(request, producto_id):
    producto = get_object_or_404(Producto, idproducto=producto_id)  # Usar get_object_or_404 para manejar el error
    carrito = Carrito(request)
    carrito.eliminar(producto)  # Lógica para eliminar producto

    return redirect('Tienda')  # Redirige a la tienda después de eliminar el producto

def update_cart(request, producto_id):
    producto = get_object_or_404(Producto, idproducto=producto_id)
    carrito = Carrito(request)

    if request.method == 'POST':
        cantidad = int(request.POST.get('cantidad'))
        carrito.actualizar(producto, cantidad) 
        return redirect('Tienda')   # Redirige a la tienda o al carrito después de actualizar
    
