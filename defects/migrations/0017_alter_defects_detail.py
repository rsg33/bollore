# Generated by Django 3.2.7 on 2021-09-09 07:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0016_alter_details_article'),
    ]

    operations = [
        migrations.AlterField(
            model_name='defects',
            name='detail',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='defects_detail', to='defects.details', verbose_name='Деталь'),
        ),
    ]