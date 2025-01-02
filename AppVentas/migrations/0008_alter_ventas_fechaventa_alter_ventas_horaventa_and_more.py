# Generated by Django 5.0.4 on 2024-07-27 17:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('AppVentas', '0007_alter_pedidos_iddomicilio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ventas',
            name='fechaventa',
            field=models.DateField(auto_now_add=True, verbose_name='Fecha Venta'),
        ),
        migrations.AlterField(
            model_name='ventas',
            name='horaventa',
            field=models.TimeField(auto_now_add=True, max_length=10, null=True, verbose_name='Hora Venta'),
        ),
        migrations.AlterField(
            model_name='ventas',
            name='idfactura',
            field=models.CharField(blank=True, max_length=45, null=True, verbose_name='Id Factura'),
        ),
    ]