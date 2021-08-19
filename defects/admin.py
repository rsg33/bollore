from django.contrib import admin

from .models import *


class DefectsAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'created_at',
                    'date_defect_detection',
                    'term_up_to',
                    'defect_eliminated',
                    'workshop',
                    'detail',
                    'body_number',
                    'number_of_inconsistencies',
                    'type_of_discrepancy',
                    'discrepancy_description',
                    'quality_controller',
                    'responsible_executor',
                    'photo'
                    )


admin.site.register(Defects)
