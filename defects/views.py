from django.shortcuts import render
from django.forms import modelformset_factory
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect, Http404
from django.contrib.auth.decorators import login_required

from .models import *
from .forms import *


def index(request):
    """Отобразить все дефекты"""
    defects = Defects.objects.order_by('-created_at')
    shops = Workshops.objects.all()
    disagreement = TypeOfMismatch.objects.all()
    bodies = Bodies.objects.all()
    counters = {'defect_count': Defects.objects.filter(status=1).count(),
                'defect_eliminated_count': Defects.objects.filter(status=2).count(),
                'defect_approved_count': Defects.objects.filter(status=3).count(),
                'production_defect_count': Defects.objects.filter(status=4).count(),
                }
    context = {
        'defects': defects,
        'shops': shops,
        'disagreement': disagreement,
        'bodies': bodies,
        'title': 'Список дефектов',
        'workshop_selected': 0,
        'counters': counters,
    }
    return render(request, 'defects/index.html', context)


def show_defect(request, defect_id):
    """Показать выбранный дефект с подробностями"""
    defects = Defects.objects.filter(pk=defect_id)
    photos = PhotoDefects.objects.filter(defect_id=defect_id)
    shops = Workshops.objects.all()
    bodies = Bodies.objects.all()
    # print(photos)
    context = {
        'defects': defects,
        'photos': photos,
        'shops': shops,
        'bodies': bodies,
        'title': 'Список дефектов',
        'workshop_selected': 0,
    }
    return render(request, 'defects/defect.html', context)


def show_workshops(request, shop_id):
    """Список цехов в навбар, для отображения по выбору цеха дефектов в контенте"""
    defects = Defects.objects.filter(workshop_id=shop_id)
    shops = Workshops.objects.all()
    disagreement = TypeOfMismatch.objects.all()
    # counters = {'defect_count': Defects.objects.filter(workshop_id=shop_id).filter(defect_eliminated=False).count(),
    #             'defect_approved_count': Defects.objects.filter(workshop_id=shop_id).filter(approved_production=True
    #                                                                                         ).count(),
    #             'defect_eliminated_count': Defects.objects.filter(
    #                 workshop_id=shop_id).filter(defect_eliminated=True,
    #                                             approved_production=False).count(),
    #             }
    if len(defects) == 0:
        raise Http404
    context = {
        'defects': defects,
        'title': 'Отображение по цехам',
        'shops': shops,
        'disagreement': disagreement,
        'workshop_selected': shop_id,
        'counters': counters,
    }
    return render(request, 'defects/index.html', context)


def show_disagreement(request, disagreement_id):
    """Список несоответствий в навбар, для отображения по выбору несоответствия дефектов в контенте"""
    defects = Defects.objects.filter(type_of_discrepancy_id=disagreement_id)
    shops = Workshops.objects.all()
    disagreement = TypeOfMismatch.objects.all()
    counters = {'defect_count': Defects.objects.filter(type_of_discrepancy_id=disagreement_id).filter(
        defect_eliminated=False).count(),
                'defect_approved_count': Defects.objects.filter(type_of_discrepancy_id=disagreement_id).filter(
                    approved_production=True
                ).count(),
                'defect_eliminated_count': Defects.objects.filter(
                    type_of_discrepancy_id=disagreement_id).filter(defect_eliminated=True,
                                                                   approved_production=False).count(),
                }
    if len(defects) == 0:
        raise Http404
    context = {
        'defects': defects,
        'title': 'Отображение по цехам',
        'shops': shops,
        'workshop_selected': disagreement_id,
        'disagreement': disagreement,
        'counters': counters,
    }
    return render(request, 'defects/index.html', context)


def all_bodies(request):
    """Отобразить картотеку кузовов в контенте"""
    shops = Workshops.objects.all()
    bodies = Bodies.objects.all()
    disagreement = TypeOfMismatch.objects.all()
    context = {
        'title': 'Картотека кузовов',
        'bodies': bodies,
        'shops': shops,
        'disagreement': disagreement,
    }
    return render(request, 'defects/bodies.html', context)


def show_body(request, body_id):
    """Показать все дефекты по выбранному кузову"""
    defects = Defects.objects.filter(body_number_id=body_id)
    shops = Workshops.objects.all()
    counters = {'defect_count': Defects.objects.filter(body_number_id=body_id).filter(defect_eliminated=False).count(),
                'defect_approved_count': Defects.objects.filter(body_number_id=body_id).filter(approved_production=True
                                                                                               ).count(),
                'defect_eliminated_count': Defects.objects.filter(
                    body_number_id=body_id).filter(defect_eliminated=True,
                                                   approved_production=False).count(),
                }

    if len(defects) == 0:
        raise Http404
    context = {
        'defects': defects,
        'title': 'Все дефекты по выбранному кузову',
        'shops': shops,
        'counters': counters,
    }
    return render(request, 'defects/index.html', context)


def add_defect(request):
    if request.method == 'POST':
        form = DefectForm(request.POST)
        if form.is_valid():
            print(form.changed_data)
    else:
        form = DefectForm()
    return render(request, 'defects/add_defect.html', {'form': form})


def pageNotFound(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')
