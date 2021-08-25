# Generated by Django 3.2.6 on 2021-08-19 12:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='defects',
            name='elimination_defect',
        ),
        migrations.AddField(
            model_name='defects',
            name='defect_eliminated',
            field=models.BooleanField(default=False, verbose_name='Дефект устранён'),
        ),
    ]