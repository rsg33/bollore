from .models import *


class MyMixin(object):
    """Миксин для классов унаследовавших ListView"""
    model = Defects
    template_name = 'defects/index.html'
    paginate_by = 2

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

    def get_context_data(self, *, object_list=None, **kwargs):
        """Функция которая наследует атрибуты от класса и добавляет доп. атрибуты в контекст"""
        context = super(MyMixin, self).get_context_data(**kwargs)
        context['counters'] = self.count_status(self.object_list)
        return context
