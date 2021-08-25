# Generated by Django 3.2.6 on 2021-08-24 11:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('defects', '0002_auto_20210819_1518'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='bodies',
            options={'verbose_name': 'номер кузова', 'verbose_name_plural': 'Номера кузовов'},
        ),
        migrations.AlterModelOptions(
            name='defects',
            options={'ordering': ['-created_at'], 'verbose_name': 'дефект', 'verbose_name_plural': 'Дефекты'},
        ),
        migrations.AlterModelOptions(
            name='details',
            options={'verbose_name': 'деталь', 'verbose_name_plural': 'Детали'},
        ),
        migrations.AlterModelOptions(
            name='typeofmismatch',
            options={'verbose_name': 'тип несоответствия', 'verbose_name_plural': 'Типы несоответствий'},
        ),
        migrations.AlterModelOptions(
            name='workshops',
            options={'verbose_name': 'цех', 'verbose_name_plural': 'Цеха'},
        ),
        migrations.RemoveField(
            model_name='defects',
            name='photo',
        ),
        migrations.CreateModel(
            name='PhotoDefects',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('photo', models.ImageField(blank=True, upload_to='photos/%Y/%m/%d/', verbose_name='Фото дефекта')),
                ('uploaded_at', models.DateTimeField(auto_now_add=True)),
                ('defect', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='defects.defects')),
            ],
        ),
    ]