from django import forms
from django.forms import ModelForm, Textarea
from .models import ReviewRating, Product


class ReviewForm(forms.ModelForm):
    class Meta:
        model = ReviewRating
        fields = ['subject', 'review', 'rating']


class ProductForm(ModelForm):

    class Meta:
        model = Product
        fields = '__all__'
        widgets = {
            'text': Textarea(attrs={'cols': 160,
                                    'rows': 20})
        }
