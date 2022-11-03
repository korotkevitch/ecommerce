from django.contrib import admin
from .models import Product, Variation, ReviewRating, ProductGallery
import admin_thumbnails
import decimal, csv
from django.http import HttpResponse
from django.db.models import F


def export_products(modeladmin, request, queryset):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="products.csv"'
    writer = csv.writer(response)
    writer.writerow(['product_name', 'price', 'stock', 'category', 'modified_date', 'is_available'])
    products = queryset.values_list('product_name', 'price', 'stock', 'category', 'modified_date', 'is_available')
    for product in products:
        writer.writerow(product)
    return response
export_products.short_description = 'Экспорт в CSV'


@admin_thumbnails.thumbnail('image')
class ProductGalleryInline(admin.TabularInline):
    model = ProductGallery
    extra = 1


from store.forms import ProductForm
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_name', 'price', 'stock', 'category', 'modified_date', 'is_available')
    prepopulated_fields = {'slug': ('product_name',)}
    inlines = [ProductGalleryInline]
    form = ProductForm
    actions = ['price_down', 'price_up', export_products]

    def price_down(self, request, queryset):
        queryset.update(price=F('price') * decimal.Decimal('0.9'))

    def price_up(self, request, queryset):
        queryset.update(price=F('price') * decimal.Decimal('1.1'))

    price_down.short_description = 'Снизить цену на 10%%'
    price_up.short_description = 'Увеличить цену на 10%%'


class VariationAdmin(admin.ModelAdmin):
    list_display = ('product', 'variation_category', 'variation_value', 'is_active')
    list_editable = ('is_active',)
    list_filter = ('product', 'variation_category', 'variation_value')

admin.site.register(Product, ProductAdmin)
admin.site.register(Variation, VariationAdmin)
admin.site.register(ReviewRating)
admin.site.register(ProductGallery)
