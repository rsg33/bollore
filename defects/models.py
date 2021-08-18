from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class TypeOfMismatch(models.Model):
    """Вид несоответствия"""
    mismatch = models.CharField(max_length=150, verbose_name='Вид несоответствия')


class Details(models.Model):
    """Детали"""
    name = models.CharField(max_length=150, verbose_name='Наименование')
    article = models.CharField(max_length=150, verbose_name='Артикул')


class Bodies(models.Model):
    """Номера кузовов"""
    body_number = models.CharField(max_length=150, verbose_name='Номер')


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
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    date_of_discovery = models.DateTimeField(verbose_name='Дата обнаружения')
    term_up_to = models.DateTimeField(verbose_name='Срок до')
    elimination_defect = models.BooleanField(default=False, verbose_name='Устранение дефекта')
    workshop = models.ForeignKey(
        Workshops,
    )


    photo = models.ImageField(upload_to='photos/%Y/%m/%d/', verbose_name='Фото дефекта', blank=True)