from django.urls import path

from .views import *

urlpatterns = [
    path('', index, name='home'),
    path('defect/<int:defect_id>/', show_defect, name='defect'),
    path('add-defect/', add_defect, name='add_defect'),
    path('workshops/<int:shop_id>/', show_workshops, name='workshops'),
    path('body/<int:body_id>/', show_body, name='bodies'),
]
