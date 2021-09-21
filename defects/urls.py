from django.urls import path

from .views import *

urlpatterns = [
    path('login/', user_login, name='login'),
    path('logout/', user_logout, name='logout'),
    # path('', index, name='home'),
    path('', HomeDefects.as_view(), name='home'),
    # path('defect/<int:defect_id>/', show_defect, name='defect'),
    path('defect/<int:pk>/', ViewDefect.as_view(), name='defect'),
    path('add-defect/', add_defect, name='add_defect'),
    # path('workshops/<int:shop_id>/', show_workshops, name='workshops'),
    path('workshops/<int:shop_id>/', DefectsByWorkshops.as_view(), name='workshops'),
    # path('disagreement/<int:disagreement_id>/', show_disagreement, name='disagreement'),
    path('disagreement/<int:disagreement_id>/', DefectsByDisagreement.as_view(), name='disagreement'),
    # path('body/<int:body_id>/', show_body, name='bodies'),
    path('body/<int:body_id>/', DefectsByBody.as_view(), name='bodies'),
    # path('all-bodies/', all_bodies, name='all-bodies'),
    path('all-bodies/', AllBodies.as_view(), name='all-bodies'),
]
