from django import forms

from .models import *


class DefectForm(forms.Form):
    date_defect_detection = forms.DateField(widget = forms.SelectDateWidget)
    # date_defect_detection = forms.DateField(widget=forms.DateInput(
    #     attrs={'type': 'date',
    #            'class': 'form-control',
    #            'placeholder': 'Select a date'
    #            }),
    #     label='Дата обнаружения'
    # )
    # term_up_to = forms.DateTimeField(widget=forms.DateTimeInput(
    #     attrs={'type': 'datetime-local',
    #            'class': 'form-control',
    #            'placeholder': 'Select a date'
    #            }),
    #     label='Срок до'
    # )
    # status = forms.ModelChoiceField(
    #     queryset=Status.objects.all(), label='Статус дефекта', empty_label='выберите статус дефекта'
    # )
    #
    # workshop = forms.ModelChoiceField(
    #     queryset=Workshops.objects.all(), label='Цех', empty_label='выберите цех'
    # )
    # detail = forms.ModelChoiceField(
    #     queryset=Details.objects.all(), label='Деталь', empty_label='выберите деталь',
    #     required=False,
    # )
    # body_number = forms.ModelChoiceField(
    #     queryset=Bodies.objects.all(), label='Номер кузова', empty_label='выберите номер кузова'
    # )
    # type_of_discrepancy = forms.ModelChoiceField(
    #     queryset=TypeOfMismatch.objects.all(), label='Тип несоответствия', empty_label='выберите тип несоответствия'
    # )
    # number_of_inconsistencies = forms.ModelChoiceField(
    #     queryset=NumberOfInconsistencies.objects.all(), label='Количество несоответствий',
    #     empty_label='выберите количество несоответствий'
    # )
    # probability_estimate = forms.ModelChoiceField(
    #     queryset=ProbabilityEstimate.objects.all(), label='Качественная оценка вероятности',
    #     empty_label='оцените вероятность'
    # )
    # scale_of_consequences = forms.ModelChoiceField(
    #     queryset=ScaleOfConsequences.objects.all(), label='Масштаб последствий',
    #     empty_label='оцените маштаб последствий'
    # )
    # priority = forms.ModelChoiceField(
    #     queryset=Priority.objects.all(), label='Приоритет', empty_label='оцените приоритет'
    # )
    # discrepancy_description = forms.CharField(widget=forms.Textarea(attrs={'cols': 60, 'rows': 10}),
    #                                           required=False,
    #                                           label='Описание несоответствия'
    #                                           )
    # images = forms.FileField(widget=forms.ClearableFileInput(
    #     attrs={'multiple': True}), label='Фото')

    image = forms.ImageField(widget=forms.ClearableFileInput(attrs={'multiple': True}), label='Фото')

    # class Meta:
    #     fields = '__all__'
    #     widgets = {
    #         'date_defect_detection': forms.DateInput(
    #
    #             attrs={'type': 'date',
    #                    'class': 'form-control',
    #                    'placeholder': 'Select a date'
    #                    }),
    #         'term_up_to': forms.DateTimeInput(format='%Y-%m-%d %H:%M:%S',
    #                                           attrs={'type': 'datetime-local',
    #                                                  'class': 'form-control'}),
    #     }


