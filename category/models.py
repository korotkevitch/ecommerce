from django.db import models
from django.urls import reverse
from django.utils.safestring import mark_safe
from mptt.models import MPTTModel, TreeForeignKey

# Create your models here.

class Category(MPTTModel):
    category_name = models.CharField('Название категории', max_length=50, unique=True)
    slug = models.SlugField(max_length=100, unique=True)
    description = models.CharField('Кратко о категории', max_length=250, blank=True)
    cat_image = models.ImageField('Фото 384x660', upload_to='photos/categories', blank=True)
    parent = TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')

    class MPTTMeta:
        order_insertion_by = ['category_name']

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'

    def get_url(self):
        return reverse('products_by_category', args=[self.slug])

    def cat_image_preview(self):
        if self.cat_image:
            return mark_safe('<img src="%s" style="width:60px; height:100px;" />' % self.cat_image.url)
        else:
            return 'Нет картинки'

    cat_image_preview.short_description = 'Картинка для слайдера'

    def __str__(self):
        return self.category_name
