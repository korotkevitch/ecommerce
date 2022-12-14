# Generated by Django 3.1 on 2022-08-09 10:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0004_auto_20220809_1303'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name': 'Категория', 'verbose_name_plural': 'Категории'},
        ),
        migrations.AddField(
            model_name='category',
            name='cat_details',
            field=models.CharField(blank=True, max_length=150, verbose_name='Что в категории'),
        ),
        migrations.AlterField(
            model_name='category',
            name='category_name',
            field=models.CharField(max_length=50, unique=True, verbose_name='Название категории'),
        ),
        migrations.AlterField(
            model_name='category',
            name='description',
            field=models.CharField(blank=True, max_length=100, verbose_name='Кратко о категории'),
        ),
    ]
