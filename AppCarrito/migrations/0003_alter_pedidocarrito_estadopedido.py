# Generated by Django 5.0.6 on 2024-07-28 23:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('AppCarrito', '0002_alter_pedidocarrito_iddomicilio'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pedidocarrito',
            name='estadopedido',
            field=models.CharField(choices=[('Pago en línea', 'Pago en línea'), ('Pago a contraentrega', 'Pago a contraentrega')], max_length=20, null=True),
        ),
    ]