# Generated by Django 3.2.6 on 2021-09-03 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0006_auto_20210903_1436'),
    ]

    operations = [
        migrations.AddField(
            model_name='defects',
            name='risk_level',
            field=models.CharField(default='test', max_length=150, verbose_name='Уровень риска'),
            preserve_default=False,
        ),
    ]