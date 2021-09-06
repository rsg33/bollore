from django.shortcuts import render, redirect
from django.core.files.base import ContentFile
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
    counters = {'defect_count': Defects.objects.filter(status=1, workshop_id=shop_id).count(),
                'defect_eliminated_count': Defects.objects.filter(status=2, workshop_id=shop_id).count(),
                'defect_approved_count': Defects.objects.filter(status=3, workshop_id=shop_id).count(),
                'production_defect_count': Defects.objects.filter(status=4, workshop_id=shop_id).count(),
                }
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
    counters = {'defect_count': Defects.objects.filter(
        status=1, type_of_discrepancy_id=disagreement_id).count(),
                'defect_eliminated_count': Defects.objects.filter(
                    status=2, type_of_discrepancy_id=disagreement_id).count(),
                'defect_approved_count': Defects.objects.filter(
                    status=3, type_of_discrepancy_id=disagreement_id).count(),
                'production_defect_count': Defects.objects.filter(
                    status=4, type_of_discrepancy_id=disagreement_id).count(),
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
    counters = {'defect_count': Defects.objects.filter(status=1, body_number_id=body_id).count(),
                'defect_eliminated_count': Defects.objects.filter(status=2, body_number_id=body_id).count(),
                'defect_approved_count': Defects.objects.filter(status=3, body_number_id=body_id).count(),
                'production_defect_count': Defects.objects.filter(status=4, body_number_id=body_id).count(),
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
        form = DefectForm(request.POST, request.FILES)
        if form.is_valid():
            date_defect_detection = form.cleaned_data['date_defect_detection']
            term_up_to = form.cleaned_data['term_up_to']
            status = form.cleaned_data['status']
            workshop = form.cleaned_data['workshop']
            detail = form.cleaned_data['detail']
            body_number = form.cleaned_data['body_number']
            type_of_discrepancy = form.cleaned_data['type_of_discrepancy']
            number_of_inconsistencies = form.cleaned_data['number_of_inconsistencies']
            probability_estimate = form.cleaned_data['probability_estimate']
            scale_of_consequences = form.cleaned_data['scale_of_consequences']
            priority = form.cleaned_data['priority']
            discrepancy_description = form.cleaned_data['discrepancy_description']
            quality_controller = form.cleaned_data['quality_controller']
            responsible_executor = form.cleaned_data['responsible_executor']

            # Вычисляем уровень риска умножив оценку вероятности на маштаб последствий
            a = ProbabilityEstimate.objects.get(description=probability_estimate).score
            b = ScaleOfConsequences.objects.get(description=scale_of_consequences).score
            risk_level_score = a * b
            # где 1-5 Невысокий риск, 6-10 Средний риск, 12-15 Высокий риск, 16 и выше - Крайне высокий риск
            if 1 <= risk_level_score <= 5:
                risk_level = 'Невысокий риск'
            elif 6 <= risk_level_score <= 10:
                risk_level = 'Средний риск'
            elif 12 <= risk_level_score <= 15:
                risk_level = 'Высокий риск'
            elif 16 <= risk_level_score <= 25:
                risk_level = 'Крайне высокий риск'
            else:
                risk_level = 'Ошибка в программе'

            # Записываем полученные данные из формы в таблицу Defects
            defect = Defects.objects.create(
                date_defect_detection=date_defect_detection,
                term_up_to=term_up_to,
                status=status,
                workshop=workshop,
                detail=detail,
                body_number=body_number,
                type_of_discrepancy=type_of_discrepancy,
                number_of_inconsistencies=number_of_inconsistencies,
                probability_estimate=probability_estimate,
                scale_of_consequences=scale_of_consequences,
                priority=priority,
                discrepancy_description=discrepancy_description,
                quality_controller=quality_controller,
                responsible_executor=responsible_executor,
                risk_level=risk_level
            )
            # print(type(probability_estimate))
            # Загружаем изображения и прописываем их в таблице PhotoDefects
            for f in request.FILES.getlist('images'):
                data = f.read()  # Если файл целиком умещается в памяти
                photo = PhotoDefects(defect=defect)
                photo.photo.save(f.name, ContentFile(data))
                photo.save()
            # return redirect('home')
    else:
        form = DefectForm()
    return render(request, 'defects/add_defect.html', {'form': form})


def pageNotFound(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')
