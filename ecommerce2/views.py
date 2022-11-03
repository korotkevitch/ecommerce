from django.shortcuts import render
from store.models import Product, ReviewRating
from django.db.models import Max
from itertools import chain
from django.db.models import Sum


def home(request):
    products = Product.objects.all().filter(is_available=True).order_by('-created_date')
    new_products_1 = Product.objects.all().filter(is_available=True, category__category_name='Бортики в кроватку').annotate(Max('price')).order_by('-price')[:2]
    new_products_2 = Product.objects.all().filter(is_available=True, category__category_name='Конверты на выписку').annotate(Max('price')).order_by('-price')[:2]
    new_products_3 = Product.objects.all().filter(is_available=True, category__category_name='Ползунки').annotate(Max('price')).order_by('-price')[:2]
    new_products_4 = Product.objects.all().filter(is_available=True, category__category_name='Комбинезоны').annotate(Max('price')).order_by('-price')[:2]
    new_products_5 = Product.objects.all().filter(is_available=True, category__category_name='Шапочки').annotate(Max('price')).order_by('-price')[:2]
    new_products_6 = Product.objects.all().filter(is_available=True, category__category_name='Пледы детские').annotate(Max('price')).order_by('-price')[:2]
    new_products = list(chain(new_products_1, new_products_2, new_products_3, new_products_4, new_products_5, new_products_6))
    popular_products = Product.objects.filter(orderproduct__ordered=True).annotate(
        product_ordered=Sum('orderproduct__quantity')).order_by('-product_ordered')[:3]
    cat_1_products = Product.objects.all().filter(category__category_name='Конверты на выписку')[:8]
    cat_2_products = Product.objects.all().filter(category__category_name='Комбинезоны')[:8]

    # Get the reviews
    reviews = None
    for product in products:
        reviews = ReviewRating.objects.filter(product_id=product.id, status=True)

    context = {
        'products': products,
        'reviews': reviews,
        'cat_1_products': cat_1_products,
        'cat_2_products': cat_2_products,
        'new_products': new_products,
        'popular_products': popular_products,
    }
    return render(request, 'home.html', context)
