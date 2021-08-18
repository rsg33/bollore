from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class TypeOfMismatch(models.Model):
    """Вид несоответствия"""
    pass


class Details(models.Model):
    """Детали"""
    pass


class Bodies(models.Model):
    """Кузова"""
    name = models.CharField(max_length=150, verbose_name='Номер')


class Workshops(models.Model):
    """Цеха"""
    name = models.CharField(max_length=150, verbose_name='Наименование')
    responsible_executor = models.ForeignKey(User,
                                             on_delete=models.CASCADE,
                                             related_name='responsible_executor',
                                             default='1',
                                             verbose_name='Ответственный исполнитель'
                                             )


class Defects(models.Model):
    pass
