from django.urls import path

from .views import *

urlpatterns = [
    path('', index, name='home'),
    path('defects/add-defect/', add_defect, name='add_defect')
]
