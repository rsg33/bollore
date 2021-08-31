from django.contrib.auth import get_user_model
from django.db import models
from django.urls import reverse

User = get_user_model()


class TypeOfMismatch(models.Model):
    """Вид несоответствия"""
    mismatch = models.CharField(max_length=150, verbose_name='Тип несоответствия')

    def get_absolute_url(self):
        return reverse('disagreement', kwargs={'disagreement_id': self.pk})

    def __str__(self):
        return self.mismatch

    class Meta:
        verbose_name = 'тип несоответствия'
        verbose_name_plural = 'Типы несоответствий'


class Details(models.Model):
    """Детали"""
    name = models.CharField(max_length=150, verbose_name='Наименование')
    article = models.CharField(max_length=150, unique=True, verbose_name='Артикул')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'деталь'
        verbose_name_plural = 'Детали'


class Bodies(models.Model):
    """Номера кузовов"""
    body_number = models.CharField(max_length=150, unique=True, verbose_name='Номер кузова')

    def get_absolute_url(self):
        return reverse('bodies', kwargs={'body_id': self.pk})

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

    def get_absolute_url(self):
        return reverse('workshops', kwargs={'shop_id': self.pk})

    def __str__(self):
        return self.name_workshop

    class Meta:
        verbose_name = 'цех'
        verbose_name_plural = 'Цеха'


class Defects(models.Model):
    """Дефект"""
    """Определение уровня риска"""
    PROBABILITY_ESTIMATE = (
        (1, 'Крайне маловероятно'),
        (2, 'Маловероятно'),
        (3, 'Возможно'),
        (4, 'Весьма вероятно'),
        (5, 'Практически достоверно'),
    )
    """Качественная оценка вероятности"""

    SCALE_OF_CONSEQUENCES = (
        (1, 'Незначительный'),
        (2, 'Небольшой'),
        (3, 'Средний'),
        (4, 'Высокий'),
        (5, 'Крайне высокий'),
    )
    """Масштаб последствий реализации риска"""

    STATUS = (
        (1, 'Обнаружен дефект'),
        (2, 'Дефект устранён'),
        (3, 'Допущено к производству'),
        (4, 'Брак'),
    )
    """Статус дефекта"""

    PRIORITY = (
        (1, 'Низкий'),
        (2, 'Средний'),
        (3, 'Высокий'),
        (4, 'Срочный'),
    )
    """Приоритет"""

    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    date_defect_detection = models.DateField(verbose_name='Дата обнаружения')
    term_up_to = models.DateTimeField(verbose_name='Срок до')
    status = models.IntegerField(choices=STATUS,
                                 default=1,
                                 verbose_name='Статус дефекта')

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
                                    verbose_name='Номер кузова',
                                    unique=True
                                    )
    type_of_discrepancy = models.ForeignKey(TypeOfMismatch,
                                            on_delete=models.PROTECT,
                                            related_name='defects_type_of_discrepancy',
                                            verbose_name='Тип несоответствия',
                                            )
    number_of_inconsistencies = models.IntegerField(verbose_name='Количество несоответствий')
    probability_estimate = models.IntegerField(choices=PROBABILITY_ESTIMATE,
                                               default=3,
                                               verbose_name='Качественная оценка вероятности')
    scale_of_consequences = models.IntegerField(choices=SCALE_OF_CONSEQUENCES,
                                                default=3,
                                                verbose_name='Масштаб последствий')
    priority = models.IntegerField(choices=PRIORITY, default=2, verbose_name='Приоритет')
    discrepancy_description = models.TextField(blank=True, verbose_name='Описание несоответствия',
                                               default='Отсутствует')
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

    def get_absolute_url(self):
        return reverse('defect', kwargs={'defect_id': self.pk})

    def __str__(self):
        return self.body_number.body_number

    class Meta:
        verbose_name = 'дефект'
        verbose_name_plural = 'Дефекты'
        ordering = ['-created_at']


class PhotoDefects(models.Model):
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/', verbose_name='Фото дефекта', blank=True)
    defect = models.ForeignKey(Defects, on_delete=models.CASCADE, related_name="images", verbose_name='Дефект')
    uploaded_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = 'фото'
        verbose_name_plural = 'Фото дефектов'
        ordering = ['-uploaded_at']
