# Generated by Django 3.2.7 on 2021-09-28 06:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0003_defects_term_up_to'),
    ]

    operations = [
        migrations.AlterField(
            model_name='defects',
            name='for_checking',
            field=models.BooleanField(default=False, verbose_name='На проверку'),
        ),
    ]
