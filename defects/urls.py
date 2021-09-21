from django.urls import path

from .views import *

urlpatterns = [
    path('login/', user_login, name='login'),
    path('logout/', user_logout, name='logout'),

    path('', HomeDefects.as_view(), name='home'),

    path('status/<int:pk>/', DefectsByStatus.as_view(), name='status'),
    path('all-defects/', DefectsAll.as_view(), name='all-defects'),


    path('defect/<int:pk>/', ViewDefect.as_view(), name='defect'),
    path('add-defect/', add_defect, name='add_defect'),

    path('workshops/<int:shop_id>/', DefectsByWorkshops.as_view(), name='workshops'),

    path('disagreement/<int:disagreement_id>/', DefectsByDisagreement.as_view(), name='disagreement'),

    path('body/<int:body_id>/', DefectsByBody.as_view(), name='bodies'),

    path('all-bodies/', AllBodies.as_view(), name='all-bodies'),
]
