# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-10-19 01:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mensagem', '0006_auto_20181019_0141'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailparticipacaobanca',
            name='visualizada',
            field=models.DateField(auto_now=True, verbose_name='Visualizada em'),
        ),
    ]
