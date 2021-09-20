from django.core.files.base import ContentFile
from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView

from .forms import *
from .utils import MyMixin


class HomeDefects(MyMixin, ListView):
    """Отображение всех дефектов"""
    # Переопределение object_list
    # context_object_name = 'defects'

    # Передача доп атрибутов (желательно исп только для статичных данных)
    # extra_context = {'title': 'Дефекты'}

    def get_context_data(self, *, object_list=None, **kwargs):
        """Функция которая наследует атрибуты от класса и добавляет доп. атрибуты в контекст"""
        context = super(HomeDefects, self).get_context_data(**kwargs)
        context['title'] = 'Дефекты'  # Объявляем заголовок
        return context

    def get_queryset(self):
        """Функция переопределяет запрос по умолчанию ко всем объектам, на получение по условию или фильтрации"""
        return Defects.objects.order_by('-created_at')


class ViewDefect(DetailView):
    """Отображение выбранного дефекта с подробностями"""
    model = Defects

    def get_context_data(self, *, object_list=None, **kwargs):
        """Функция которая наследует атрибуты от класса и добавляет доп. атрибуты в контекст"""
        context = super(ViewDefect, self).get_context_data(**kwargs)
        context['title'] = 'Выбранный дефект'  # Объявляем заголовок
        context['photos'] = PhotoDefects.objects.filter(defect_id=self.object.pk)
        a = self.object.type_of_discrepancy.probability_estimate.score  # Балл оценки вероятности дефекта
        b = self.object.type_of_discrepancy.scale_consequences.score  # Балл масштаба последствий дефекта
        risk_level = a * b  # Балл уровня риска
        context['risk_level'] = risk_level
        return context


class DefectsByWorkshops(MyMixin, ListView):
    """Список цехов в навбаре, для отображения по выбору цеха дефектов в контенте"""
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DefectsByWorkshops, self).get_context_data(**kwargs)
        context['title'] = Workshops.objects.get(pk=self.kwargs['shop_id'])  # Объявляем заголовок
        return context

    def get_queryset(self):
        return Defects.objects.filter(workshop_id=self.kwargs['shop_id']).order_by('-created_at')


class DefectsByDisagreement(MyMixin, ListView):
    """Список несоответствий в навбаре, для отображения по выбору несоответствия дефектов в контенте"""
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DefectsByDisagreement, self).get_context_data(**kwargs)
        context['title'] = TypeOfMismatch.objects.get(pk=self.kwargs['disagreement_id'])  # Объявляем заголовок
        return context

    def get_queryset(self):
        return Defects.objects.filter(type_of_discrepancy_id=self.kwargs['disagreement_id']).order_by('-created_at')


class DefectsByBody(MyMixin, ListView):
    """Показать все дефекты по выбранному кузову"""
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DefectsByBody, self).get_context_data(**kwargs)
        context['title'] = f"Кузов {Bodies.objects.get(pk=self.kwargs['body_id'])}"  # Объявляем заголовок
        return context

    def get_queryset(self):
        return Defects.objects.filter(body_number_id=self.kwargs['body_id']).order_by('-created_at')


class AllBodies(ListView):
    """Отобразить картотеку кузовов в контенте"""
    model = Bodies
    extra_context = {'title': 'Картотека кузовов'}


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
            priority = form.cleaned_data['priority']
            discrepancy_description = form.cleaned_data['discrepancy_description']
            # Надо проверить залогинен ли и выдать исключение
            quality_controller = request.user  # Надо проверить залогинен ли и выдать исключение
            # Надо проверить залогинен ли и выдать исключение

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
                priority=priority,
                discrepancy_description=discrepancy_description,
                # quality_controller=request.user,
                quality_controller=quality_controller,
                responsible_executor=workshop.responsible_executor,
            )
            # Загружаем изображения и прописываем их в таблице PhotoDefects
            for f in request.FILES.getlist('images'):
                data = f.read()  # Если файл целиком умещается в памяти
                photo = PhotoDefects(defect=defect)
                photo.photo.save(f.name, ContentFile(data))
                photo.save()

            return redirect('home')
    else:
        form = DefectForm()
    return render(request, 'defects/add_defect.html', {'form': form})

# def page_not_found(request, exception):
#     return HttpResponseNotFound('<h1>Страница не найдена</h1>')

# def calc_risk(defects):
#     """Калькулятор рисков для класса"""
#     risk_levels = []  # пустой список оценок риска
#     for item in defects:
#         a = item.type_of_discrepancy.probability_estimate.score  # Балл оценки вероятности дефекта
#         b = item.type_of_discrepancy.scale_consequences.score  # Балл масштаба последствий дефекта
#         risk_level = a * b  # Балл уровня риска
#         risk_levels.append(risk_level)  # Добавляем в список вычисленное значение
#     return risk_levels


# counters = {
#     'defect_count': Defects.objects.filter(status=1).count(),  # С дефектом
#     'defect_eliminated_count': Defects.objects.filter(status=2).count(),  # Дефект устранен
#     'defect_approved_count': Defects.objects.filter(status=3).count(),  # Допущен с дефектом
#     'production_defect_count': Defects.objects.filter(status=4).count(),  # Брак
# }


# def calc_risk(defects):
#     """Калькулятор рисков"""
#     defects_mod = []  # пустой список для модифицированного списка объектов
#     for item in defects:
#         a = item.type_of_discrepancy.probability_estimate.score
#         b = item.type_of_discrepancy.scale_consequences.score
#         risk_level = a * b  # Вычисляем уровень риска умножив оценку вероятности на маштаб последствий.
#         item.risk_level = risk_level # В текущем объекте создаем атрибут risk_level и присваиваем ему
#         # полученное значение
#         defects_mod.append(item)  # добавляем в список модифицированный объект
#     print(defects_mod)
#     return defects_mod

# def index(request):
#     """Отобразить все дефекты"""
#     defects = Defects.objects.order_by('-created_at')
#     shops = Workshops.objects.all()
#     disagreement = TypeOfMismatch.objects.all()
#     bodies = Bodies.objects.all()
#     defects_mod = calc_risk(defects)
#     counters = {
#         'all_defects': len(defects_mod),  # Все дефекты
#         'defect_count': Defects.objects.filter(status=1).count(),  # С дефектом
#         'defect_eliminated_count': Defects.objects.filter(status=2).count(),  # Дефект устранен
#         'defect_approved_count': Defects.objects.filter(status=3).count(),  # Допущен с дефектом
#         'production_defect_count': Defects.objects.filter(status=4).count(),  # Брак
#     }
#
#     context = {
#         'defects': defects_mod,
#         'shops': shops,
#         'disagreement': disagreement,
#         'bodies': bodies,
#         'title': 'Список дефектов',
#         'workshop_selected': 0,
#         'counters': counters,
#     }
#     return render(request, 'defects/index.html', context)


# def show_defect(request, defect_id):
#     """Показать выбранный дефект с подробностями"""
#     defects = Defects.objects.filter(pk=defect_id)
#     shops = Workshops.objects.all()
#     disagreement = TypeOfMismatch.objects.all()
#     bodies = Bodies.objects.all()
#     photos = PhotoDefects.objects.filter(defect_id=defect_id)
#     defects_mod = calc_risk(defects)
#     context = {
#         'defects': defects_mod,
#         'shops': shops,
#         'disagreement': disagreement,
#         'bodies': bodies,
#         'title': 'Список дефектов',
#         'workshop_selected': 0,
#         'photos': photos,
#     }
#     return render(request, 'defects/defect.html', context)


# def show_workshops(request, shop_id):
#     """Список цехов в навбаре, для отображения по выбору цеха дефектов в контенте"""
#     defects = Defects.objects.filter(workshop_id=shop_id)
#     shops = Workshops.objects.all()
#     disagreement = TypeOfMismatch.objects.all()
#     defects_mod = calc_risk(defects)
#     counters = {
#         'all_defects': len(defects_mod),  # Все дефекты
#         'defect_count': Defects.objects.filter(status=1, workshop_id=shop_id).count(),  # С дефектом
#         'defect_eliminated_count': Defects.objects.filter(status=2, workshop_id=shop_id).count(),  # Дефект устранен
#         'defect_approved_count': Defects.objects.filter(status=3, workshop_id=shop_id).count(),  # Допущен с дефектом
#         'production_defect_count': Defects.objects.filter(status=4, workshop_id=shop_id).count(),  # Брак
#     }
#     if len(defects) == 0:
#         raise Http404
#     context = {
#         'defects': defects,
#         'title': 'Отображение по цехам',
#         'shops': shops,
#         'disagreement': disagreement,
#         'workshop_selected': shop_id,
#         'counters': counters,
#     }
#     return render(request, 'defects/index.html', context)


# def show_disagreement(request, disagreement_id):
#     """Список несоответствий в навбар, для отображения по выбору несоответствия дефектов в контенте"""
#     defects = Defects.objects.filter(type_of_discrepancy_id=disagreement_id)
#     shops = Workshops.objects.all()
#     disagreement = TypeOfMismatch.objects.all()
#     defects_mod = calc_risk(defects)
#     counters = {
#         'all_defects': len(defects_mod),  # Все дефекты
#         'defect_count': Defects.objects.filter(
#             status=1,
#             type_of_discrepancy_id=disagreement_id).count(),  # С дефектом
#         'defect_eliminated_count': Defects.objects.filter(
#             status=2,
#             type_of_discrepancy_id=disagreement_id).count(),  # Дефект устранен
#         'defect_approved_count': Defects.objects.filter(
#             status=3,
#             type_of_discrepancy_id=disagreement_id).count(),  # Допущен с дефектом
#         'production_defect_count': Defects.objects.filter(
#             status=4,
#             type_of_discrepancy_id=disagreement_id).count(),  # Брак
#     }
#     if len(defects) == 0:
#         raise Http404
#     context = {
#         'defects': defects_mod,
#         'title': 'Отображение по цехам',
#         'shops': shops,
#         'workshop_selected': disagreement_id,
#         'disagreement': disagreement,
#         'counters': counters,
#     }
#     return render(request, 'defects/index.html', context)


# def show_body(request, body_id):
#     """Показать все дефекты по выбранному кузову"""
#     defects = Defects.objects.filter(body_number_id=body_id)
#     shops = Workshops.objects.all()
#     defects_mod = calc_risk(defects)
#     counters = {'defect_count': Defects.objects.filter(status=1, body_number_id=body_id).count(),
#                 'defect_eliminated_count': Defects.objects.filter(status=2, body_number_id=body_id).count(),
#                 'defect_approved_count': Defects.objects.filter(status=3, body_number_id=body_id).count(),
#                 'production_defect_count': Defects.objects.filter(status=4, body_number_id=body_id).count(),
#                 }
#
#     if len(defects) == 0:
#         raise Http404
#     context = {
#         'defects': defects_mod,
#         'title': 'Все дефекты по выбранному кузову',
#         'shops': shops,
#         'counters': counters,
#     }
#     return render(request, 'defects/index.html', context)


# def all_bodies(request):
#     """Отобразить картотеку кузовов в контенте"""
#     # shops = Workshops.objects.all()
#     bodies = Bodies.objects.all()
#     # disagreement = TypeOfMismatch.objects.all()
#     context = {
#         'title': 'Картотека кузовов',
#         'bodies': bodies,
#         # 'shops': shops,
#         # 'disagreement': disagreement,
#     }
#     return render(request, 'defects/bodies.html', context)
