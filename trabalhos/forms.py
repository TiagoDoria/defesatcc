# -*- coding: utf-8 -*-
from django import forms

from .models import Trabalhos, DefesaTrabalho
from accounts.models import Usuario


class TrabalhoForm(forms.ModelForm):
	""" titulo = forms.CharField(label='Título',widget=forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Título'}))
	titulo = forms.CharField(label='Título',widget=forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Título'}))
	class Meta:
		model = Trabalhos
		fields = ['titulo'] """

	class Meta:
		model = Trabalhos
		fields = ('titulo', 'keywords', 'autor', 'orientador', 'co_orientador', 'resumo', 'pdf_trabalho')
		widgets = {
			'titulo': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Título'}),
			'keywords': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Palavras chaves'}),
			'autor': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Autor'}),
			'orientador': forms.Select(attrs={'class':'form-control','disabled': 'disabled'}),
			'co_orientador': forms.TextInput(attrs={'class':'form-control form-control-user','placeholder':'Co-Orientador'}),
			'resumo': forms.Textarea(attrs={'class':'form-control','placeholder':'Resumo'})
		}

class TrabalhoBancaForm(forms.ModelForm):
	banca = forms.ModelMultipleChoiceField(
		label='Banca',
		queryset=Usuario.objects.order_by('name')
	)
 
	class Meta:
		model = Trabalhos
		fields = ('banca',)

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
		widgets = {
			'local': forms.TextInput(attrs={'class': 'form-control form-control-user'}),		
		 	'data': forms.TextInput(attrs={'class': 'datepicker form-control form-control-user'}),
			'hora': forms.TextInput(attrs={'class': 'timepicker form-control form-control-user'}),
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
