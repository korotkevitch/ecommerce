# Generated by Django 3.2.4 on 2022-09-12 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_name',
            field=models.CharField(max_length=200, unique=True, verbose_name='Товары'),
        ),
    ]
