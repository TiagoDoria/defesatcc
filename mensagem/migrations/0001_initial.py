# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2019-01-23 19:43
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('trabalhos', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='EmailParticipacaoBanca',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=100, unique=True, verbose_name='Chave')),
                ('visualizada', models.DateField(blank=True, null=True, verbose_name='Visualizada em')),
                ('tipo', models.CharField(max_length=30, verbose_name='Tipo')),
                ('destinatario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='usuario', to=settings.AUTH_USER_MODEL, verbose_name='Usuario')),
                ('remetente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='usuarios', to=settings.AUTH_USER_MODEL, verbose_name='Usuarios')),
                ('trabalho', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='trabalhos', to='trabalhos.Trabalhos', verbose_name='Trabalhos')),
            ],
        ),
    ]
