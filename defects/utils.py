from django.contrib.auth.mixins import LoginRequiredMixin

from .models import *


class MyMixin(LoginRequiredMixin, object):
    """Миксин для классов унаследовавших ListView"""
    model = Defects
    login_url = 'login'
    paginate_by = 6
