# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-10-19 01:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mensagem', '0002_auto_20181019_0120'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailparticipacaobanca',
            name='visualizada',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]