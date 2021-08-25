from django.shortcuts import render
from django.forms import modelformset_factory
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect, Http404
from django.contrib.auth.decorators import login_required

from .models import *
from .forms import *


def index(request):
    defects = Defects.objects.order_by('-created_at')
    shops = Workshops.objects.all()
    context = {
        'defects': defects,
        'shops': shops,
        'title': 'Список дефектов',
        'workshop_selected': 0,
    }
    return render(request, 'defects/index.html', context)


def show_defect(request, defect_id):
    return HttpResponse(f"Дефект c id = {defect_id}")


def show_workshops(request, shop_id):
    defects = Defects.objects.filter(workshop_id=shop_id)
    shops = Workshops.objects.all()

    if len(defects) == 0:
        raise Http404
    context = {
        'defects': defects,
        'title': 'Отображение по цехам',
        'shops': shops,
        'workshop_selected': shop_id,
    }
    return render(request, 'defects/index.html', context)


@login_required
def add_defect(request):
    ImageFormSet = modelformset_factory(PhotoDefects,
                                        form=ImageForm, extra=2)
    # 'extra' means the number of photos that you can upload   ^
    if request.method == 'POST':

        postForm = Defects(request.POST)
        formset = ImageFormSet(request.POST, request.FILES,
                               queryset=PhotoDefects.objects.none())

        if postForm.is_valid() and formset.is_valid():
            post_form = postForm.save(commit=False)
            post_form.user = request.user
            post_form.save()

            for form in formset.cleaned_data:
                # this helps to not crash if the user
                # do not upload all the photos
                if form:
                    image = form['image']
                    photo = PhotoDefects(post=post_form, image=image)
                    photo.save()
            # use django messages framework
            messages.success(request,
                             "Yeeew, check it out on the home page!")
            return HttpResponseRedirect("/")
        else:
            print(postForm.errors, formset.errors)
    else:
        postForm = DefectForm()
        formset = ImageFormSet(queryset=PhotoDefects.objects.none())
    return render(request, 'defects/add_defect.html',
                  {'postForm': postForm, 'formset': formset})


def pageNotFound(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')
