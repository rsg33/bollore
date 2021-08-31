from django import forms
from .models import Defects, PhotoDefects


class DefectForm(forms.ModelForm):
    # date_defect_detection = forms.DateField()
    # term_up_to = forms.DateTimeField()
    # defect_eliminated = forms.BooleanField
    # workshop = forms.F

    class Meta:
        model = Defects
        fields = ['date_defect_detection', 'term_up_to', 'workshop']


class ImageForm(forms.ModelForm):
    image = forms.ImageField(label='Image')

    class Meta:
        model = PhotoDefects
        fields = ('photo',)
