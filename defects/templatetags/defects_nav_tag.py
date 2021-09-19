from django import template

from defects.models import Workshops, TypeOfMismatch

register = template.Library()


@register.simple_tag(name='nav_objects')
def get_nav_objects():
    """Получаем для навбара объекты"""
    nav_objects = {
        'shops': Workshops.objects.all(),
        'disagreement': TypeOfMismatch.objects.all(),
        'workshop_selected': 0
    }
    return nav_objects
