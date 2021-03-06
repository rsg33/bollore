from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.forms import ModelForm

from .models import *


class UserLoginForm(AuthenticationForm):
    username = forms.CharField(label='Имя пользователя', widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'}))


class DefectForm(forms.Form):
    """Форма добавления дефекта"""
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

    images = forms.ImageField(widget=forms.ClearableFileInput(
        attrs={'multiple': True,
               'class': 'filestyle',
               'data-classButton': "btn btn-primary",
               'placeholder': "Add profile picture",
               }),
        required=False,
        label='Фото')

    email_notification = forms.BooleanField(initial=True, required=False, label='Оповещение по email')


class DefectEditForm(ModelForm):
    """Форма редактирования дефекта"""
    date_defect_detection = forms.DateField(widget=forms.DateInput(
        attrs={'class': 'form-control',
               'placeholder': 'Select a date'
               }),
        label='Дата обнаружения'
    )
    term_up_to = forms.DateTimeField(widget=forms.DateTimeInput(
        attrs={'class': 'form-control',
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

    images = forms.ImageField(widget=forms.ClearableFileInput(
        attrs={'multiple': True,
               'class': 'filestyle',
               'data-classButton': "btn btn-primary",
               'placeholder': "Add profile picture",
               }),
        required=False,
        label='Фото')

    email_notification = forms.BooleanField(initial=True, required=False, label='Оповещение по email')

    class Meta:
        model = Defects
        fields = 'date_defect_detection', 'term_up_to', 'priority', 'for_checking', 'status', 'workshop', 'detail', \
                 'body_number', 'type_of_discrepancy', 'discrepancy_description', 'images'


class EditCheckingForm(ModelForm):
    """Форма добавления коментария к дефекту"""
    comment = forms.CharField(widget=forms.Textarea(attrs={
        'class': "form-control",
        "rows": 5
    }),
        label='Комментарий'
    )

    class Meta:
        model = Comments
        fields = 'comment',
