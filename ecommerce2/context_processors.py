from django.db.models import Sum
from store.models import Product


def popular(request):
    popular_products = Product.objects.filter(orderproduct__ordered=True).annotate(product_ordered=Sum('orderproduct__quantity')).order_by('-product_ordered')[:3]
    return dict(popular_products=popular_products)