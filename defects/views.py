from django.shortcuts import render
from django.http import HttpResponse, HttpResponseNotFound

def add_defect(request):
    return HttpResponse('Hello word')

def pageNotFound(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')