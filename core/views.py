from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from trabalhos.models import Trabalhos, DefesaTrabalho

@login_required
def home(request):
	template_name = None
	template_name = 'core/home.html'
	return render(request, template_name)

