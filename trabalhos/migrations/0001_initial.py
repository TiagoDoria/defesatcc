# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2019-01-23 19:42
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BancaTrabalho',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('aceito_pelo_orientador', 'aceito_pelo_orientador'), ('aceito_pelo_avaliador', 'aceito_pelo_avaliador'), ('negado_pelo_orientador', 'negado_pelo_orientador'), ('negado_pelo_avaliador', 'negado_pelo_avaliador'), ('pendentes_de_resposta', 'pendentes_de_resposta')], default='pendentes_de_resposta', max_length=30, verbose_name='Status')),
            ],
        ),
        migrations.CreateModel(
            name='DefesaTrabalho',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('local', models.CharField(max_length=250, verbose_name='Local')),
                ('data', models.DateField(verbose_name='Data')),
                ('hora', models.TimeField(verbose_name='Horário')),
                ('ano', models.IntegerField(verbose_name='Ano')),
                ('semestre', models.IntegerField(verbose_name='Semestre')),
                ('periodo', models.CharField(max_length=250, verbose_name='Período')),
                ('status', models.CharField(choices=[('pendente_banca_avaliadora', 'Aguardando reposta confirmação dos avaliadores'), ('agendado', 'Agendado')], default='pendente_banca_avaliadora', max_length=30, verbose_name='Status')),
            ],
        ),
        migrations.CreateModel(
            name='Trabalhos',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=250, verbose_name='Título')),
                ('keywords', models.CharField(max_length=150, verbose_name='Palavras Chaves')),
                ('autor', models.CharField(max_length=250, verbose_name='Autor')),
                ('co_orientador', models.CharField(blank=True, max_length=250, verbose_name='Co Orientador')),
                ('resumo', models.TextField(blank=True, verbose_name='Resumo')),
                ('pdf_trabalho', models.FileField(blank=True, null=True, upload_to='trabalhos/media')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Atualizado em')),
                ('banca', models.ManyToManyField(related_name='bancas', through='trabalhos.BancaTrabalho', to=settings.AUTH_USER_MODEL)),
                ('orientador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='orientador', to=settings.AUTH_USER_MODEL, verbose_name='orientador')),
            ],
        ),
        migrations.AddField(
            model_name='defesatrabalho',
            name='trabalho',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='trabalhos.Trabalhos', verbose_name='trabalho'),
        ),
        migrations.AddField(
            model_name='bancatrabalho',
            name='trabalho',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trabalhos.Trabalhos'),
        ),
        migrations.AddField(
            model_name='bancatrabalho',
            name='usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
