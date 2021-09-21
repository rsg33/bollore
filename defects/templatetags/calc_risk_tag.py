from django import template

register = template.Library()


@register.simple_tag()
def calc_risk(probability_estimate, scale_consequences):
    """Калькулятор рисков для класса"""
    # a = probability_estimate  # Балл оценки вероятности дефекта
    # b = scale_consequences  # Балл масштаба последствий дефекта
    # risk_level = a * b  # Балл уровня риска
    return probability_estimate * scale_consequences
