from django.contrib import admin

from .models import *


class TypeOfMismatchAdmin(admin.ModelAdmin):
    list_display = ('mismatch', 'probability_estimate', 'scale_consequences')
    list_display_links = ('mismatch',)


class DetailsAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'article',
                    'name',
                    )
    list_display_links = ('article',)
    search_fields = ('article',)


class BodiesAdmin(admin.ModelAdmin):
    list_display = ('body_number', 'id',)
    list_display_links = ('body_number',)
    search_fields = ('body_number',)


class WorkshopsAdmin(admin.ModelAdmin):
    list_display = ('name_workshop',
                    'responsible_executor',
                    )
    list_display_links = ('name_workshop',)


class ProbabilityEstimateAdmin(admin.ModelAdmin):
    list_display = ('score',
                    'description',
                    )
    list_display_links = ('description',)


class ScaleOfConsequencesAdmin(admin.ModelAdmin):
    list_display = ('score',
                    'description',
                    )
    list_display_links = ('description',)


class StatusAdmin(admin.ModelAdmin):
    list_display = (
        'defect_status',
    )
    list_display_links = ('defect_status',)


class PriorityAdmin(admin.ModelAdmin):
    list_display = (
        'priority_status',
    )
    list_display_links = ('priority_status',)


class DefectsAdmin(admin.ModelAdmin):
    list_display = ('id',
                    'date_defect_detection',
                    'term_up_to',
                    'for_checking',
                    'status',
                    'workshop',
                    'detail',
                    'body_number',
                    'number_of_inconsistencies',
                    'type_of_discrepancy',
                    'discrepancy_description',
                    'quality_controller',
                    'responsible_executor',
                    'created_at',
                    )
    list_display_links = ('date_defect_detection',)
    search_fields = ('body_number__body_number', 'workshop__name_workshop',)


class PhotoDefectsAdmin(admin.ModelAdmin):
    list_display = (
        'photo',
        'defect',
        'uploaded_at',
    )
    list_display_links = ('defect',)


class CommentsAdmin(admin.ModelAdmin):
    list_display = (
        'defect',
        'author',
        'comment',
        'published_at',
    )
    list_display_links = ('comment',)


admin.site.register(TypeOfMismatch, TypeOfMismatchAdmin)
admin.site.register(Details, DetailsAdmin)
admin.site.register(Bodies, BodiesAdmin)
admin.site.register(Workshops, WorkshopsAdmin)
admin.site.register(ProbabilityEstimate, ProbabilityEstimateAdmin)
admin.site.register(ScaleOfConsequences, ScaleOfConsequencesAdmin)
admin.site.register(Status, StatusAdmin)
admin.site.register(Priority, PriorityAdmin)
admin.site.register(Defects, DefectsAdmin)
admin.site.register({PhotoDefects}, PhotoDefectsAdmin)
admin.site.register(Comments, CommentsAdmin)
