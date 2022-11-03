from django.contrib import admin
from mptt.admin import DraggableMPTTAdmin
from .models import Category
from store.models import Product

# Register your models here.

# class CategoryAdmin(admin.ModelAdmin):
#     prepopulated_fields = {'slug': ('category_name',)}
#     list_display = ('category_name', 'slug', 'description', 'cat_details', 'cat_image_preview')
#
# admin.site.register(Category, CategoryAdmin)

class CategoryAdmin(DraggableMPTTAdmin):
    mptt_indent_field = "category_name"
    list_display = ('tree_actions', 'indented_title',
                    'related_products_count', 'related_products_cumulative_count')
    list_display_links = ('indented_title',)
    prepopulated_fields = {'slug': ('category_name',)}

    def get_queryset(self, request):
        qs = super().get_queryset(request)

        # Add cumulative product count
        qs = Category.objects.add_related_count(
                qs,
                Product,
                'category',
                'products_cumulative_count',
                cumulative=True)

        # Add non cumulative product count
        qs = Category.objects.add_related_count(qs,
                 Product,
                 'category',
                 'stock',  # сколько осталось товара в магазине
                 cumulative=False)
        return qs

    def related_products_count(self, instance):
        return instance.stock
    related_products_count.short_description = 'Товаров в категории'

    def related_products_cumulative_count(self, instance):
        return instance.products_cumulative_count
    related_products_cumulative_count.short_description = 'Товаров во всех категорях'

admin.site.register(Category, CategoryAdmin)