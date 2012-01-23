from django.db import models

# Create your models here.
class Testthing(models.Model):
    thing = models.CharField(max_length=255)
