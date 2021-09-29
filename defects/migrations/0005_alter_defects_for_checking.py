# Generated by Django 3.2.6 on 2021-09-28 17:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0004_alter_defects_for_checking'),
    ]

    operations = [
        migrations.AlterField(
            model_name='defects',
            name='for_checking',
            field=models.BooleanField(choices=[(True, 'Yes'), (False, 'No')], default=False, verbose_name='На проверку'),
        ),
    ]