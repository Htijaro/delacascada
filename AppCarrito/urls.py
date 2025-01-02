from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.tienda, name='Tienda'),
    path('add/<int:producto_id>/', views.add_to_cart, name='Add'),
    path('sub/<int:producto_id>/', views.sub_from_cart, name='Sub'),
    path('update_cart/<int:producto_id>/', views.update_cart, name='update_cart'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

