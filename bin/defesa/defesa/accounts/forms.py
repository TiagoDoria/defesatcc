from django import forms

from django.contrib.auth.forms import UserCreationForm

class CadastroForm(UserCreationForm):

	email = forms.EmailField(label='E-mail')

	def save(self, commit=True)
		user = super(CadastroForm, self).save(commit=False)
		user.email = self.cleaned_data['email']
		if commit:
			user.save()
		return user	
