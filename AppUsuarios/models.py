from django.db import models
from django.contrib.auth.models import AbstractUser


class Usuarios(AbstractUser):

    email = models.EmailField(unique=True)
    direccion = models.CharField(max_length=100, null=True)
    telefono = models.CharField(max_length=20, null=True)
    observaciones = models.CharField(max_length=150, null=True)





# Create your models here.
