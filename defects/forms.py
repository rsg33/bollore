from django import forms

from .models import *


class DefectForm(forms.Form):
    # date_defect_detection = forms.DateField(widget=forms.SelectDateWidget)
    date_defect_detection = forms.DateField(widget=forms.DateInput(
        attrs={'type': 'date',
               'class': 'form-control',
               'placeholder': 'Select a date'
               }),
        label='Дата обнаружения'
    )
    term_up_to = forms.DateTimeField(widget=forms.DateTimeInput(
        attrs={'type': 'datetime-local',
               'class': 'form-control',
               'placeholder': 'Select a date'
               }),
        label='Срок до'
    )
    status = forms.ModelChoiceField(
        queryset=Status.objects.all(),
        label='Статус дефекта',
        empty_label='выберите статус дефекта',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    workshop = forms.ModelChoiceField(
        queryset=Workshops.objects.all(),
        label='Цех',
        empty_label='выберите цех',
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    detail = forms.ModelChoiceField(
        queryset=Details.objects.all(),
        label='Деталь',
        empty_label='выберите деталь',
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=False,
    )
    body_number = forms.ModelChoiceField(
        queryset=Bodies.objects.all(),
        label='Номер кузова',
        empty_label='выберите номер кузова',
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    type_of_discrepancy = forms.ModelChoiceField(
        queryset=TypeOfMismatch.objects.all(),
        label='Тип несоответствия',
        empty_label='выберите тип несоответствия',
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    number_of_inconsistencies = forms.IntegerField(
        min_value=1,
        initial=1,
        label='Количество несоответствий',
        widget=forms.NumberInput(attrs={'class': 'form-control'})
    )
    priority = forms.ModelChoiceField(
        queryset=Priority.objects.all(),
        label='Приоритет',
        empty_label='оцените приоритет',
        widget=forms.Select(attrs={'class': 'form-control'}),
        initial=2,
        required=False,
    )
    discrepancy_description = forms.CharField(widget=forms.Textarea(attrs={
        'class': "form-control",
        "rows": 5
    }),
        required=False,
        label='Описание несоответствия'
    )

    quality_controller = forms.ModelChoiceField(
        queryset=User.objects.all(),
        label='Контролер ОТК',
        empty_label='Контролер',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    responsible_executor = forms.ModelChoiceField(
        queryset=User.objects.all(),
        label='Ответственный исполнитель',
        empty_label='Исполнитель',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    images = forms.ImageField(widget=forms.ClearableFileInput(
        attrs={'multiple': True,
               'class': 'filestyle',
               'data-classButton': "btn btn-primary",
               'placeholder': "Add profile picture",
               }),
        required=False,
        label='Фото')
