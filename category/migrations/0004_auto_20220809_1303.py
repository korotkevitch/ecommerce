# Generated by Django 3.1 on 2022-08-09 10:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0003_category_cat_slider'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='cat_slider',
        ),
        migrations.AlterField(
            model_name='category',
            name='cat_image',
            field=models.ImageField(blank=True, upload_to='photos/categories', verbose_name='Фото 384x660'),
        ),
    ]
