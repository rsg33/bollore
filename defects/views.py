import random
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.core.files.base import ContentFile
from django.db.models import Count
from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView, DeleteView

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
        try:
            a = Workshops.objects.get(responsible_executor_id=self.request.user.id)
            return Defects.objects.filter(status_id=1, workshop__responsible_executor_id=self.request.user.id).order_by(
                '-created_at')
        except Workshops.DoesNotExist:
            return Defects.objects.filter(status_id=1).order_by(
                '-created_at')


class ViewDefect(MyMixin, DetailView):
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


class DefectsAll(MyMixin, ListView):
    """Отображение всех дефектов"""
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DefectsAll, self).get_context_data(**kwargs)
        context['title'] = 'Дефекты'  # Объявляем заголовок
        return context

    def get_queryset(self):
        return Defects.objects.order_by('-created_at')


class DefectsByStatus(MyMixin, ListView):
    """Отображение по выбору статуса дефекта в контенте"""
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DefectsByStatus, self).get_context_data(**kwargs)
        context['title'] = Status.objects.get(pk=self.kwargs['pk'])  # Объявляем заголовок
        return context

    def get_queryset(self):
        return Defects.objects.filter(status_id=self.kwargs['pk']).order_by('-created_at')


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
    paginate_by = 14
    extra_context = {'title': 'Картотека кузовов'}


class MyDashboard(ListView):
    """Показания статистики на главной"""
    template_name = 'defects/dashboard.html'
    allow_empty = False

    def count_status(self, object_list):
        """Счетчик вычесляет кол-во различных статусов дефектов текущего контекста."""
        counters = {
            'defect_all_count': 0,  # Всего
            'defect_count': 0,  # С дефектом
            'defect_eliminated_count': 0,  # Дефект устранен
            'defect_approved_count': 0,  # Допущен с дефектом
            'production_defect_count': 0,  # Брак
        }

        for i in object_list:
            counters['defect_all_count'] = counters['defect_all_count'] + 1
            if i.status.pk == 1:  # С дефектом id=1
                counters['defect_count'] = counters['defect_count'] + 1
            elif i.status.pk == 2:  # Дефект устранен id=2
                counters['defect_eliminated_count'] = counters['defect_eliminated_count'] + 1
            elif i.status.pk == 3:  # Допущен с дефектом id=3
                counters['defect_approved_count'] = counters['defect_approved_count'] + 1
            elif i.status.pk == 4:  # Брак id=4
                counters['production_defect_count'] = counters['production_defect_count'] + 1
        return counters

    def defects_body_count(self, request_base):
        """Запрос возвращает номера кузовов у которых есть дефекты и кол-во дефектов для каждого кузова"""
        names_bodies = []
        body_count = []
        color_rgba = []

        for body in request_base:
            names_bodies.append(body['body_number'])
            body_count.append(body['total'])
            color_rgba.append(random.randint(0, 255))
        return names_bodies, body_count, color_rgba

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(MyDashboard, self).get_context_data(**kwargs)
        context['title'] = 'Статистика'  # Объявляем заголовок
        context['counters'] = self.count_status(self.object_list)

        request_base = Bodies.objects.values('body_number').filter(
            defects_body_number__status_id=1
        ).annotate(total=Count('body_number')).order_by('body_number')

        context['names_bodies'], context['body_count'], context['color_rgba'] = self.defects_body_count(request_base)

        return context

    def get_queryset(self):
        return Defects.objects.order_by('-created_at')


@login_required(login_url='login')
def add_defect(request):  # юзается только если залогинен
    """Добавление дефекта"""
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

            url_defect = f'http://{get_current_site(request)}{defect.get_absolute_url()}'
            send_mail(
                'Обнаружен дефект',
                f"""
                Кузов: {body_number},
                Цех: {workshop} 
                Тип: {type_of_discrepancy} 
                Ссылка на дефект: {url_defect}""",
                'otk-bmg@bakulingroup.ru',
                ['s.rubtsov@bakulingroup.ru'],
                fail_silently=False,
            )
            return redirect('defect', pk=defect.pk)
            # return redirect('home')

    else:
        form = DefectForm()
    return render(request, 'defects/add_defect.html', {'form': form})


@login_required(login_url='login')
def edit_defect(request, id_defect):  # юзается только если залогинен
    """Редактирование дефекта"""
    defect = Defects.objects.get(id=id_defect)
    if request.method == 'POST':
        form = DefectEditForm(request.POST, request.FILES)
        if form.is_valid():
            date_defect_detection = form.cleaned_data['date_defect_detection']
            term_up_to = form.cleaned_data['term_up_to']
            for_checking = form.cleaned_data['for_checking']
            status = form.cleaned_data['status']
            workshop = form.cleaned_data['workshop']
            detail = form.cleaned_data['detail']
            body_number = form.cleaned_data['body_number']
            type_of_discrepancy = form.cleaned_data['type_of_discrepancy']
            number_of_inconsistencies = form.cleaned_data['number_of_inconsistencies']
            priority = form.cleaned_data['priority']
            discrepancy_description = form.cleaned_data['discrepancy_description']
            # Надо проверить залогинен ли и выдать исключение (Дописать это место)
            quality_controller = request.user  # Надо проверить залогинен ли и выдать исключение
            # Надо проверить залогинен ли и выдать исключение

            # Записываем полученные данные из формы в таблицу Defects
            defect = Defects.objects.update(
                date_defect_detection=date_defect_detection,
                term_up_to=term_up_to,
                for_checking=for_checking,
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
                photo = PhotoDefects(defect_id=id_defect)
                photo.photo.save(f.name, ContentFile(data))
                photo.save()
            return redirect('defect', pk=id_defect)
            # return redirect('home')

    if request.method == 'GET':
        form = DefectEditForm(instance=defect)
        print(defect.pk)
    return render(request, 'defects/edit_defect.html', {'form': form, 'defect': defect})


class DeleteDefectView(MyMixin, DeleteView):
    success_url = "/"

    def get_context_data(self, *, object_list=None, **kwargs):
        """Функция которая наследует атрибуты от класса и добавляет доп. атрибуты в контекст"""
        context = super(DeleteDefectView, self).get_context_data(**kwargs)
        context['title'] = 'Удаляем дефект'  # Объявляем заголовок
        return context


def user_login(request):
    if request.method == 'POST':
        form = UserLoginForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('home')
    else:
        form = UserLoginForm()
    return render(request, 'defects/login.html', {'form': form})


def user_logout(request):
    logout(request)
    return redirect('home')

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
