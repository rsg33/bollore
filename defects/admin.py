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
                    )


class TypeOfMismatchAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'mismatch'
                    )


class DetailsAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'name',
                    'article'
                    )


class BodiesAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'body_number'
                    )


class WorkshopsAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'name_workshop',
                    'responsible_executor'
                    )


class PhotoDefectsAdmin(admin.ModelAdmin):
    list_display = (
        'photo',
        'defect',
        'uploaded_at',
    )

admin.site.register(Defects, DefectsAdmin)
admin.site.register(TypeOfMismatch, TypeOfMismatchAdmin)
admin.site.register(Details, DetailsAdmin)
admin.site.register(Bodies, BodiesAdmin)
admin.site.register(Workshops, WorkshopsAdmin)
admin.site.register({PhotoDefects}, PhotoDefectsAdmin)
