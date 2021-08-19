from django.contrib.auth import get_user_model
from django.db import models

User = get_user_model()


class TypeOfMismatch(models.Model):
    """Вид несоответствия"""
    mismatch = models.CharField(max_length=150, verbose_name='Тип несоответствия')

    def __str__(self):
        return self.mismatch

    class Meta:
        verbose_name = 'тип несоответствия'
        verbose_name_plural = 'Типы несоответствий'


class Details(models.Model):
    """Детали"""
    name = models.CharField(max_length=150, verbose_name='Наименование')
    article = models.CharField(max_length=150, verbose_name='Артикул')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'деталь'
        verbose_name_plural = 'Детали'


class Bodies(models.Model):
    """Номера кузовов"""
    body_number = models.CharField(max_length=150, verbose_name='Номер кузова')

    def __str__(self):
        return self.body_number

    class Meta:
        verbose_name = 'номер кузова'
        verbose_name_plural = 'Номера кузовов'


class Workshops(models.Model):
    """Цеха"""
    name_workshop = models.CharField(max_length=150, verbose_name='Цех')
    responsible_executor = models.ForeignKey(User,
                                             on_delete=models.PROTECT,
                                             related_name='workshops_responsible_executor',
                                             verbose_name='Ответственный исполнитель'
                                             )

    def __str__(self):
        return self.name_workshop

    class Meta:
        verbose_name = 'цех'
        verbose_name_plural = 'Цеха'


class Defects(models.Model):
    """Дефект"""
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    date_defect_detection = models.DateField(verbose_name='Дата обнаружения')
    term_up_to = models.DateTimeField(verbose_name='Срок до')
    defect_eliminated = models.BooleanField(default=False, verbose_name='Дефект устранён')
    workshop = models.ForeignKey(Workshops,
                                 on_delete=models.PROTECT,
                                 related_name='defects_workshop',
                                 verbose_name='Цех'
                                 )
    detail = models.ForeignKey(Details,
                               on_delete=models.PROTECT,
                               related_name='defects_detail',
                               verbose_name='Деталь',
                               blank=True
                               )
    body_number = models.ForeignKey(Bodies,
                                    on_delete=models.PROTECT,
                                    related_name='defects_body_number',
                                    verbose_name='Номер кузова'
                                    )
    number_of_inconsistencies = models.IntegerField(verbose_name='Количество несоответствий')
    type_of_discrepancy = models.ForeignKey(TypeOfMismatch,
                                            on_delete=models.PROTECT,
                                            related_name='defects_type_of_discrepancy',
                                            verbose_name='Тип несоответствия',
                                            )
    discrepancy_description = models.TextField(blank=True, verbose_name='Описание несоответствия')
    quality_controller = models.ForeignKey(User,
                                           on_delete=models.PROTECT,
                                           related_name='defects_quality_controller',
                                           verbose_name='Контролер ОТК'
                                           )
    responsible_executor = models.ForeignKey(User,
                                             on_delete=models.PROTECT,
                                             related_name='defects_responsible_executor',
                                             verbose_name='Ответственный исполнитель'
                                             )
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/', verbose_name='Фото дефекта', blank=True)

    def __str__(self):
        return self.body_number

    class Meta:
        verbose_name = 'дефект'
        verbose_name_plural = 'Дефекты'
        ordering = ['-created_at']
