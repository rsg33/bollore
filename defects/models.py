from django.contrib.auth import get_user_model
from django.db import models
from django.urls import reverse

User = get_user_model()


class TypeOfMismatch(models.Model):
    """Вид несоответствия"""
    mismatch = models.CharField(max_length=150, verbose_name='Тип несоответствия')
    probability_estimate = models.ForeignKey('ProbabilityEstimate',
                                             on_delete=models.PROTECT,
                                             related_name='mismatch_probability_estimate',
                                             verbose_name='Оценка вероятности'
                                             )
    scale_consequences = models.ForeignKey('ScaleOfConsequences',
                                           on_delete=models.PROTECT,
                                           related_name='mismatch_scale_consequences',
                                           verbose_name='Масштаб последствий'
                                           )

    def get_absolute_url(self):
        return reverse('disagreement', kwargs={'disagreement_id': self.pk})

    def __str__(self):
        return self.mismatch

    class Meta:
        verbose_name = 'тип несоответствия'
        verbose_name_plural = 'Типы несоответствий'


class Details(models.Model):
    """Детали"""
    article = models.CharField(max_length=150, unique=True, verbose_name='Артикул', blank=True, null=True)
    name = models.CharField(max_length=150, verbose_name='Наименование')

    def __str__(self):
        return '%s %s %s' % (self.name, '-', self.article)

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


class ProbabilityEstimate(models.Model):
    """Качественная оценка вероятности"""
    score = models.IntegerField(default=1, verbose_name='Балл')
    description = models.CharField(max_length=150, verbose_name='Оценка')

    def __str__(self):
        return '%s %s %s' % (self.description, '-', self.score)

    class Meta:
        verbose_name = 'оценка вероятности'
        verbose_name_plural = 'Оценки вероятности'

        # (1, 'Крайне маловероятно'),
        # (2, 'Маловероятно'),
        # (3, 'Возможно'),
        # (4, 'Весьма вероятно'),
        # (5, 'Практически достоверно'),


class ScaleOfConsequences(models.Model):
    """Масштаб последствий реализации риска"""

    score = models.IntegerField(default=1, verbose_name='Балл')
    description = models.CharField(max_length=150, verbose_name='Оценка')

    def __str__(self):
        return '%s %s %s' % (self.description, '-', self.score)

    class Meta:
        verbose_name = 'масштаб последствий'
        verbose_name_plural = 'Масштабы последствий'

        # (1, 'Незначительный'),
        # (2, 'Небольшой'),
        # (3, 'Средний'),
        # (4, 'Высокий'),
        # (5, 'Крайне высокий')


class Status(models.Model):
    """Статус дефекта"""
    defect_status = models.CharField(max_length=150, verbose_name='Статус дефекта')

    def get_absolute_url(self):
        return reverse('status', kwargs={'pk': self.pk})

    def __str__(self):
        return self.defect_status

    class Meta:
        verbose_name = 'статус дефекта'
        verbose_name_plural = 'статусы дефектов'

        # (1, 'Обнаружен дефект'),
        # (2, 'Дефект устранён'),
        # (3, 'Допущено к производству'),
        # (4, 'Брак'),


class Priority(models.Model):
    """Приоритет"""
    priority_status = models.CharField(max_length=150, verbose_name='Приоритет')

    def __str__(self):
        return self.priority_status

    class Meta:
        verbose_name = 'приоритет дефекта'
        verbose_name_plural = 'Приоритеты дефектов'
        # (1, 'Низкий'),
        # (2, 'Средний'),
        # (3, 'Высокий'),
        # (4, 'Срочный'),


class Defects(models.Model):
    """Дефект"""
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    date_defect_detection = models.DateField(verbose_name='Дата обнаружения')
    term_up_to = models.DateTimeField(verbose_name='Срок до')
    BOOL_CHOICES = ((True, 'Да'), (False, 'Нет'))
    for_checking = models.BooleanField(choices=BOOL_CHOICES, default=False, verbose_name='На согласование в ОТК')
    status = models.ForeignKey(Status,
                               on_delete=models.PROTECT,
                               related_name='defects_status',
                               verbose_name='Статус дефекта',
                               )

    workshop = models.ForeignKey(Workshops,
                                 on_delete=models.PROTECT,
                                 related_name='defects_workshop',
                                 verbose_name='Цех'
                                 )
    detail = models.ForeignKey(Details,
                               on_delete=models.PROTECT,
                               related_name='defects_detail',
                               verbose_name='Деталь',
                               blank=True,
                               null=True
                               )
    body_number = models.ForeignKey(Bodies,
                                    on_delete=models.PROTECT,
                                    related_name='defects_body_number',
                                    verbose_name='Номер кузова',
                                    )
    type_of_discrepancy = models.ForeignKey(TypeOfMismatch,
                                            on_delete=models.PROTECT,
                                            related_name='defects_type_of_discrepancy',
                                            verbose_name='Тип несоответствия',
                                            )
    number_of_inconsistencies = models.IntegerField(default=1,
                                                    verbose_name='Колличество несоответствий',
                                                    )

    priority = models.ForeignKey(Priority,
                                 on_delete=models.PROTECT,
                                 related_name='defects_priority',
                                 verbose_name='Приоритет',
                                 )

    discrepancy_description = models.TextField(blank=True, verbose_name='Описание несоответствия',
                                               default='Отсутствует')
    quality_controller = models.ForeignKey(User,
                                           on_delete=models.PROTECT,
                                           related_name='defects_quality_controller',
                                           verbose_name='Контролер ОТК',
                                           blank=True,
                                           null=True
                                           )
    responsible_executor = models.ForeignKey(User,
                                             on_delete=models.PROTECT,
                                             related_name='defects_responsible_executor',
                                             verbose_name='Ответственный исполнитель',
                                             null=True
                                             )

    def get_absolute_url(self):
        return reverse('defect', kwargs={'pk': self.pk})

    def __str__(self):
        return str(self.pk)

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


class Comments(models.Model):
    comment = models.TextField(blank=True, verbose_name='Комментарии')
    defect = models.ForeignKey(Defects, on_delete=models.CASCADE, related_name="comments", verbose_name='Дефект')
    published_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = 'комментарий'
        verbose_name_plural = 'Комментарии'
        ordering = ['-published_at']
