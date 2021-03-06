# -*- coding: utf-8 -*-
from django import forms

from .models import Trabalhos, DefesaTrabalho
from accounts.models import Usuario


class TrabalhoForm(forms.ModelForm):
	class Meta:
		model = Trabalhos
		fields = ('titulo',  'autor', 'orientador', 'co_orientador', 'resumo')
		widgets = {
			'titulo': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Título'}),
			#'keywords': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Palavras chaves'}),
			'autor': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Autor'}),
			'orientador': forms.Select(attrs={'class':'form-control','disabled': 'disabled'}),
			'co_orientador': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Co-Orientador'}),
			'resumo': forms.Textarea(attrs={'class':'form-control','placeholder':'Resumo'})
		}


class TrabalhoBancaForm(forms.ModelForm):
	banca = forms.ModelMultipleChoiceField(
		label='Banca',
		queryset=Usuario.objects.order_by('name'),
  		widget=forms.SelectMultiple(attrs={'class':' form-control'})
  	)
 
	class Meta:
		model = Trabalhos
		fields = ()

class EditaTrabalhoForm(forms.ModelForm):
	titulo = forms.CharField(label='Título',widget=forms.TextInput(attrs={'class':'form-control form-control-user'}))
	keywords = forms.CharField(label='Palavas chaves',widget=forms.TextInput(attrs={'class':'form-control form-control-user'}))
	autor = forms.CharField(label='Autor',widget=forms.TextInput(attrs={'class':'form-control form-control-user'}))
	co_orientador = forms.CharField(label='Co-Orientador',widget=forms.TextInput(attrs={'class':'form-control form-control-user'}))
	resumo = forms.CharField(label='Resumo',widget=forms.Textarea(attrs={'class':'form-control form-control-user'}))
	class Meta:
		model = Trabalhos
		fields = ['titulo', 'keywords','autor','co_orientador','resumo']

class DefesaTrabalhoForm(forms.ModelForm):

	class Meta:
		model = DefesaTrabalho
		exclude = ('status',)
		fields = ('local', 'data', 'hora', 'trabalho', 'ano','semestre')
		choices=[('', '--Selecione--')
                ,('2015','2015'),('2016','2016'),('2017','2017')
                ,('2018','2018'),('2019','2019'),('2020','2020')
                ,('2021','2021'),('2022','2022'),('2023','2023')
                ,('2024','2024'),('2025','2025'),('2026','2026')]

		widgets = {
			'local': forms.TextInput(attrs={'class': 'col-md-12 form-control form-control-user'}),		
		 	'data': forms.DateInput(attrs={'required': False,'class': 'datepicker form-control form-control-user', 'type': 'date'}),
			'hora': forms.TextInput(attrs={'required': False,'class': 'timepicker form-control form-control-user', 'type': 'time'}),
      		'ano': forms.Select(choices=choices,attrs={'class': 'form-control form-control-user', 'type': 'number'}),
        	'semestre': forms.Select(choices=[('', '--Selecione--'),('1','1'),('2','2')],attrs={'class': 'form-control form-control-user','type': 'number'}),
			'trabalho': forms.Select(attrs={'disabled': 'disabled','class': 'form-control form-control-user'})
		}

	# def clean(self):
	# 	cleaned_data = super(DefesaTrabalhoForm, self).clean()
	# 	banca = cleaned_data.get('banca')
	#
	# 	if len(banca) !=3 :
	# 		self.add_error('banca',
	# 			forms.ValidationError(
	# 								  ("A banca não poder ter um número de professores convidados diferente de 3")
	# 			))
