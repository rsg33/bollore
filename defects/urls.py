from django.urls import path

from .views import add_defect

urlpatterns = [
    path('', add_defect),
]
