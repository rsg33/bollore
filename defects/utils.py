from .models import *


class MyMixin(object):
    """Миксин для классов унаследовавших ListView"""
    model = Defects
    template_name = 'defects/index.html'

    counters = {
        'defect_count': Defects.objects.filter(status=1).count(),  # С дефектом
        'defect_eliminated_count': Defects.objects.filter(status=2).count(),  # Дефект устранен
        'defect_approved_count': Defects.objects.filter(status=3).count(),  # Допущен с дефектом
        'production_defect_count': Defects.objects.filter(status=4).count(),  # Брак
    }

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
        context['counters'] = self.counters
        return context
