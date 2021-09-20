from .models import *


class MyMixin(object):
    """Миксин для классов унаследовавших ListView"""
    model = Defects
    template_name = 'defects/index.html'

    def count_status(self, object_list):
        counters = {
            'defect_count': 0,  # С дефектом
            'defect_eliminated_count': 0,  # Дефект устранен
            'defect_approved_count': 0,  # Допущен с дефектом
            'production_defect_count': 0,  # Брак
        }

        for i in object_list:
            print(i.status.pk)
            if i.status.pk == 1:  # С дефектом id=1
                counters['defect_count'] = counters['defect_count'] + 1
            elif i.status.pk == 2:  # Дефект устранен id=2
                counters['defect_eliminated_count'] = counters['defect_eliminated_count'] + 1
            elif i.status.pk == 3:  # Допущен с дефектом id=3
                counters['defect_approved_count'] = counters['defect_approved_count'] + 1
            elif i.status.pk == 4:  # Брак id=4
                counters['production_defect_count'] = counters['production_defect_count'] + 1
        return counters

    def calc_risk(self, defects):
        """Калькулятор рисков для класса"""
        risk_levels = []  # пустой список оценок риска
        for item in defects:
            a = item.type_of_discrepancy.probability_estimate.score  # Балл оценки вероятности дефекта
            b = item.type_of_discrepancy.scale_consequences.score  # Балл масштаба последствий дефекта
            risk_level = a * b  # Балл уровня риска
            risk_levels.append(risk_level)  # Добавляем в список вычисленное значение
            context_mod_zip = zip(defects, risk_levels)
        return context_mod_zip

    def get_context_data(self, *, object_list=None, **kwargs):
        """Функция которая наследует атрибуты от класса и добавляет доп. атрибуты в контекст"""
        context = super(MyMixin, self).get_context_data(**kwargs)
        context['counters'] = self.count_status(self.object_list)
        context['context_mod_zip'] = self.calc_risk(self.object_list)  # Распакуем при выводе объектов через цикл for
        # метод calc_risk из MyMixin
        return context
