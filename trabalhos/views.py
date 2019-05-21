# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from django.core.urlresolvers import reverse, reverse_lazy
from django.views.generic import CreateView
from django.views.generic.edit import UpdateView
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import messages
from wsgiref.util import FileWrapper
from django.views.generic import CreateView
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from core.mail import send_mail_template
from core.utils import  generate_hash_key
from django.conf import settings
from easy_pdf.views import PDFTemplateView
from datetime import date
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML
from django.utils.decorators import method_decorator
from accounts.decorators import acesso, valida_perfil
from .models import Trabalhos, DefesaTrabalho, BancaTrabalho
from .forms import TrabalhoForm, DefesaTrabalhoForm, TrabalhoBancaForm, EditaTrabalhoForm
from datetime import datetime
from mensagem.models import EmailParticipacaoBanca
from django.db.models import Count, Avg, Sum

def cadastrar_trabalho(request, key=None):
    template_name = 'trabalhos/forms.html'
    context = {}
    if request.method == 'POST':
        request.POST._mutable = True
        request.POST['orientador'] = request.user.id
        form = TrabalhoForm(request.POST, request.FILES)
        if form.is_valid():
            context['is_valid'] = True
            trabalho = form.save(commit=False)
            trabalho.save()
            banca = BancaTrabalho.objects.create(usuario=request.user, trabalho=trabalho, status='aceito_pelo_orientador')
            banca.save()
            messages.success(request, 'Tcc cadastrado com sucesso')
            return redirect('core:home')
    else:
        form = TrabalhoForm(initial={'orientador': request.user.id})
    context['form'] = form
    return render(request, template_name, context)


def detalhe(request, pk):
    trabalhos = get_object_or_404(Trabalhos,pk=pk)
    context = {
        'trabalhos': trabalhos
    }

    template_name = 'trabalhos/detalhe.html'

    return render(request, template_name, context)


class TrabalhoUpdateView(UpdateView):
    template_name = 'trabalhos/editar.html'
    model = Trabalhos
    success_url = reverse_lazy(
        "core:home"
    )
    form_class = EditaTrabalhoForm
    """  fields = [
        'titulo',
        'keywords',
        'autor',
        'co_orientador',
        'resumo',
        'pdf_trabalho'
    ] """

    def form_invalid(self, form):
        """
        If the form is invalid, re-render the context data with the
        data-filled form and errors.
        """
        return self.render_to_response(self.get_context_data(form=form))

    def form_valid(self, form):
        messages.success(self.request, ("Trabalho atualizado com sucesso!"))
        return super(TrabalhoUpdateView, self).form_valid(form)


class TrabalhoDetail(APIView):
    def get_object(self, pk):
        try:
            return Trabalhos.objects.get(pk=pk)
        except Trabalhos.DoesNotExist:
            raise Http404

    def delete(self, request, pk, format=None):
        trabalho = self.get_object(pk)
        trabalho.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class AgendamentoDetail(APIView):
    def get_object(self, pk):
        try:
            return DefesaTrabalho.objects.get(pk=pk)
        except DefesaTrabalho.DoesNotExist:
            raise Http404

    def delete(self, request, pk, format=None):
        defesa = self.get_object(pk)
        defesa.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def get(self,request, pk, format=None):
        defesa = self.get_object(pk)
        banca = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado').values_list('usuario', flat=True)
        context = {
            'defesa': defesa,
            'banca': banca
        }
        template_name = 'trabalhos/detalhe_agendamento.html'
        return  render(request, template_name, context)


class DefesaTrabablhoCreate(CreateView):
    template_name = 'trabalhos/agendamento_cadastro.html'
    model = DefesaTrabalho
    form_class = DefesaTrabalhoForm
    success_url = reverse_lazy(
        "core:home"
    )

    def form_valid(self, form):
        avaliador = form.cleaned_data['banca'][0]
        self.object = form.save(commit=False)
        self.object.save()
        for user in form.cleaned_data['banca']:
            banca = BancaTrabalho.objects.create(usuario = user,defesa_trabalho = self.object)
        messages.success(self.request, ("Agendamento realizado com sucesso"))
        return super(DefesaTrabablhoCreate, self).form_valid(form)


def defesatrabalho(request, pk):

    def envia_email(defesa, user):

        key = generate_hash_key(user.name)
        email_participacao_banca = EmailParticipacaoBanca(
            remetente=request.user,
            destinatario=user,
            key=key,
            trabalho=defesa.trabalho,
            tipo='convite de participação'
        )
        email_participacao_banca.save()

        base_url = request.scheme + "://" + request.get_host()
        template_name = 'mensagem/banca/convite_participacao_banca.html'
        if(settings.DEV):
            subject = 'Convite para compor a banca avaliadora do trabalho ' + unicode(defesa.trabalho.titulo)
        else:
            subject = 'Convite para compor a banca avaliadora do trabalho ' + defesa.trabalho.titulo
        context = {'defesa': defesa, 'base_url': base_url, 'key': key}
        send_mail_template(subject, template_name, context, [user.username], request.user.username)



    if request.method == 'POST':
        request.POST._mutable = True
        request.POST['defesa-trabalho'] = pk
        defesa = DefesaTrabalho.objects.filter(trabalho_id=pk)
        if defesa:
            form_defesa = DefesaTrabalhoForm(request.POST, instance=defesa.get(trabalho_id=pk), prefix='defesa')
        else:
            form_defesa = DefesaTrabalhoForm(request.POST, prefix='defesa')
        form_banca = TrabalhoBancaForm(request.POST, prefix='banca')
        usuario_nao_cadastrado = request.POST['tags'].split(',')

        if form_defesa.is_valid() and form_banca.is_valid():
            defesa = form_defesa.save(commit=False)

            for usuario_email in usuario_nao_cadastrado:
                if usuario_email:
                    key = generate_hash_key(usuario_email)
                    email_participacao_banca = EmailParticipacaoBanca(
                        remetente=defesa.trabalho.orientador,
                        destinatario=defesa.trabalho.orientador,
                        key=key,
                        trabalho=defesa.trabalho,
                        tipo='convite de participação'
                    )
                    email_participacao_banca.save()

                    template_name = 'trabalhos/banca/convite_usuario_nao_cadastrado.html'
                    if (settings.DEV):
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + unicode(
                            defesa.trabalho.titulo)
                    else:
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + defesa.trabalho.titulo
                    base_url = request.scheme + "://" + request.get_host()
                    context = {'trabalho': defesa.trabalho, 'base_url': base_url, 'key': key}

                    send_mail_template(subject, template_name, context, [usuario_email])

            for user in form_banca.cleaned_data['banca']:
                banca = BancaTrabalho.objects.filter(usuario = user, trabalho = defesa.trabalho)
                if not banca:
                    banca = BancaTrabalho.objects.create(usuario = user, trabalho = defesa.trabalho)
                    banca.save()
                    envia_email(defesa, user)

            banca = BancaTrabalho.objects.filter(trabalho=pk).exclude(status__contains='negado')
            if usuario_nao_cadastrado[0] == '' and banca.filter(status__contains='aceito').count() >= 3:
                defesa.status = 'agendado'
                banca = banca.filter(status__contains='aceito')
                if (settings.DEV):
                    subject = 'Confinmação da defesa do trabalho ' + unicode(defesa.trabalho.titulo)
                else:
                    subject = 'Confirmação da defesa do trabalho ' + defesa.trabalho.titulo
                template_name = 'mensagem/banca/confirmado_agendamento_defesa.html'
                context = {'trabalho': defesa.trabalho, 'defesa': defesa, 'avaliadores': banca}
                for avaliador in form_banca.cleaned_data['banca']:
                    print(avaliador.email)
                    send_mail_template(
                        subject,
                        template_name,
                        context,
                        [avaliador.email]
                    )

            defesa.save()
            messages.success(request,'agendamento cadastrado com sucesso e convite enviado para os avaliadores')
            return redirect('core:home')

    template_name = 'trabalhos/agendamento_cadastro.html'
    trabalho = Trabalhos.objects.get(pk=pk)
    defesa = DefesaTrabalho.objects.filter(trabalho=trabalho)

    if defesa:
        form_defesa = DefesaTrabalhoForm(initial={'local': defesa[0].local,
                                                    'data': defesa[0].data.strftime('%d/%m/%Y'),
                                                    'hora': defesa[0].hora.strftime('%H:%M'),
                                                    'periodo': defesa[0].periodo,
                                                    'trabalho': pk}, prefix='defesa')
    else:
        form_defesa = DefesaTrabalhoForm(initial={'trabalho': pk}, prefix='defesa')

    banca = BancaTrabalho.objects.filter(trabalho_id=pk)
    menbros = banca.filter(status__contains='aceito')
    if banca:
        form = TrabalhoBancaForm(initial={'banca': banca.filter(status__contains='aceito').values_list('usuario', flat=True)}, prefix='banca')
    else:
        form = TrabalhoBancaForm(prefix='banca')

    context = {'form': form, 'form_defesa': form_defesa, 'titulo': trabalho.titulo, 'bancas': menbros}
    return render(request, template_name, context)


def banca_trabalho(request, pk):

    def envia_email(trabalho, user, template_name, subject):

        key = generate_hash_key(user.name)
        email_participacao_banca = EmailParticipacaoBanca(
            remetente=request.user,
            destinatario=user,
            key=key,
            trabalho=trabalho,
            tipo='convite de participação'
        )
        email_participacao_banca.save()

        base_url = request.scheme + "://" + request.get_host()
        context = {'trabalho': trabalho, 'usuario': user, 'base_url': base_url, 'key': key}
        send_mail_template(subject, template_name, context, [user.email])


    trabalho = Trabalhos.objects.get(pk=pk)

    template_name = 'trabalhos/banca/banca_trabalho.html'
    banca = BancaTrabalho.objects.filter(trabalho_id=pk).exclude(status__contains='negado')
    if trabalho.orientador == request.user:
        if request.method == 'POST':
            mensage = ''
            usuario_nao_cadastrado = request.POST['tags'].split(',')
            form = TrabalhoBancaForm(request.POST, prefix='banca')
            if form.is_valid():
                banca_avaliador_excluido = banca
                for user in form.cleaned_data['banca']:
                    banca_avaliador_excluido = banca_avaliador_excluido.exclude(usuario=user)
                    banca_novo_avaliador = BancaTrabalho.objects.filter(usuario = user, trabalho = trabalho)
                    if not banca_novo_avaliador:
                        banca_novo_avaliador = BancaTrabalho.objects.create(usuario = user, trabalho = trabalho)
                        banca_novo_avaliador.save()
                        template_name_email = 'trabalhos/banca/convite_participacao_banca.html'
                        if (settings.DEV):
                            subject = 'Convite para compor a banca avaliadora do trabalho ' + unicode(
                                trabalho.titulo)
                        else:
                            subject = 'Convite para compor a banca avaliadora do trabalho ' + trabalho.titulo
                        envia_email(trabalho, user, template_name_email, subject)
                        mensage = 'O convite foi enviado com sucesso'

                for avaliador_negado in banca_avaliador_excluido:
                    avaliador_negado.status = 'negado_pelo_orientador'
                    avaliador_negado.save()
                    template_name_email = 'trabalhos/banca/convite_rejeitado.html'
                    if (settings.DEV):
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + unicode(
                            trabalho.titulo)
                    else:
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + trabalho.titulo
                    envia_email(trabalho, avaliador_negado.usuario,template_name_email,subject)

            for usuario_email in usuario_nao_cadastrado:
                if usuario_email:
                    key = generate_hash_key(usuario_email)
                    email_participacao_banca = EmailParticipacaoBanca(
                        remetente=trabalho.orientador,
                        destinatario=trabalho.orientador,
                        key=key,
                        trabalho=trabalho,
                        tipo='convite de participação'
                    )
                    email_participacao_banca.save()

                    template_name = 'trabalhos/banca/convite_usuario_nao_cadastrado.html'
                    if (settings.DEV):
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + unicode(
                            trabalho.titulo)
                    else:
                        subject = 'Convite para compor a banca avaliadora do trabalho ' + trabalho.titulo
                    base_url = request.scheme + "://" + request.get_host()
                    context = {'trabalho': trabalho, 'base_url': base_url, 'key': key}

                    send_mail_template(subject, template_name, context, [usuario_email])
                    mensage = 'O convite foi enviado com sucesso'

            messages.success(request,mensage)
            return redirect('core:home')
        if banca:
            form = TrabalhoBancaForm(initial={'banca': banca.filter(status__contains='aceito').values_list('usuario', flat=True)},prefix='banca')
        else:
            form = TrabalhoBancaForm(prefix='banca')

        context = {'form': form, 'titulo': trabalho.titulo}
        return render(request, template_name, context)
    else:
        return redirect('core:home')

def banca_pendente(request,key=None):
	trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
	defesas = DefesaTrabalho.objects.all()
	template_name = 'trabalhos/banca_pendente.html'
	context = {}
	list = []
	for defesa in defesas:
		avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
		lista = []
		for avaliador in avaliadores:
			lista.append(avaliador.name)

		defesas_dic = {
			'id': defesa.id,
			'local': defesa.local,
			'data': defesa.data,
			'hora': defesa.hora,
            'periodo': defesa.periodo,
			'trabalho': defesa.trabalho,
			'banca': lista,
			'status': defesa.status,
		}
		list.append(defesas_dic)
	context = {"trabalhos": trabalhos, "defesas": list}
	return  render(request, template_name, context)

def agendamento_pendente(request,key=None):
	trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
	defesas = DefesaTrabalho.objects.all()
	template_name = 'trabalhos/agendamento_pendente.html'
	context = {}
	list = []
	for defesa in defesas:
		avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
		lista = []
		for avaliador in avaliadores:
			lista.append(avaliador.name)

		defesas_dic = {
			'id': defesa.id,
			'local': defesa.local,
			'data': defesa.data,
			'hora': defesa.hora,
            'periodo': defesa.periodo,
			'trabalho': defesa.trabalho,
			'banca': lista,
			'status': defesa.status,
		}
		list.append(defesas_dic)
	context = {"trabalhos": trabalhos, "defesas": list}
	return  render(request, template_name, context)
    

def defesas_confirmadas(request):
	trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
	defesas = DefesaTrabalho.objects.all()
	list = []
	template_name = 'trabalhos/defesa_confirmada.html'
	context = {}
	for defesa in defesas:
		avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
		lista = []
		for avaliador in avaliadores:
			lista.append(avaliador.name)

		defesas_dic = {
			'id': defesa.id,
			'local': defesa.local,
			'data': defesa.data,
			'hora': defesa.hora,
            'periodo': defesa.periodo,
			'trabalho': defesa.trabalho,
			'banca': lista,
			'status': defesa.status,
		}
		list.append(defesas_dic)
	context = {"trabalhos": trabalhos, "defesas": list}
	return  render(request, template_name, context)
    

def html_to_pdf_view_defesa(request):
    if(request.user.perfil.descricao == "Coordenador"):
        trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
        defesas = DefesaTrabalho.objects.all()
        list = []
        for defesa in defesas:
            avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
            lista = []
            for avaliador in avaliadores:
                lista.append(avaliador.name)

            defesas_dic = {
                'id': defesa.id,
                'local': defesa.local,
                'data': defesa.data,
                'hora': defesa.hora,
                'periodo': defesa.periodo,
                'trabalho': defesa.trabalho,
                'banca': lista,
                'status': defesa.status,
            }
            list.append(defesas_dic)
        html_string = render_to_string('trabalhos/relatorios/relatorio_defesa.html', {'trabalhos': trabalhos, 'defesas': list})

        html = HTML(string=html_string)
        html.write_pdf(target='/tmp/relatorio_defesa.pdf');

        fs = FileSystemStorage('/tmp')
        with fs.open('relatorio_defesa.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="relatorio_defesa.pdf"'
            return response

        return response
    else:
        return redirect('core:home')

def html_to_pdf_view_membro(request):
    if(request.user.perfil.descricao == "Professor"):
        trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
        defesas = DefesaTrabalho.objects.filter(trabalho__orientador = request.user.id)
        list = []
        for defesa in defesas:
            avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
            lista = []
            for avaliador in avaliadores:
                lista.append(avaliador.name)

            defesas_dic = {
                'id': defesa.id,
                'trabalho': defesa.trabalho,
                'banca': lista,
                'status': defesa.status,
            }
            list.append(defesas_dic)
        html_string = render_to_string('trabalhos/relatorios/relatorio_membro.html', {'trabalhos': trabalhos, 'defesas': list})

        html = HTML(string=html_string)
        html.write_pdf(target='/tmp/relatorio_membro.pdf');

        fs = FileSystemStorage('/tmp')
        with fs.open('relatorio_membro.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="relatorio_membro.pdf"'
            return response

        return response
    else:
        return redirect('core:home')
def relatorio_defesa(request):
    trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
    defesas = DefesaTrabalho.objects.all()
    list = []
    template_name = 'trabalhos/relatorios/view_relatorio_defesa.html'
    context = {}
    for defesa in defesas:
	    avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
	    lista = []
	    for avaliador in avaliadores:
		    lista.append(avaliador.name)

	    defesas_dic = {
			'id': defesa.id,
			'local': defesa.local,
			'data': defesa.data,
			'hora': defesa.hora,
            'periodo': defesa.periodo,
			'trabalho': defesa.trabalho,
			'banca': lista,
			'status': defesa.status,
		}
	    list.append(defesas_dic)
    context = {"trabalhos": trabalhos, "defesas": list}
    if(request.user.perfil.descricao == "Coordenador"):
        return  render(request, template_name, context)
    else:
        return redirect('core:home')

def relatorio_membro(request):
    trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
    defesas = DefesaTrabalho.objects.filter(trabalho__orientador = request.user.id)
    list = []
    template_name = 'trabalhos/relatorios/view_relatorio_membro.html'
    context = {}
    for defesa in defesas:
	    avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
	    lista = []
	    for avaliador in avaliadores:
		    lista.append(avaliador.name)

	    defesas_dic = {
			'id': defesa.id,
			'trabalho': defesa.trabalho,
			'banca': lista,
			'status': defesa.status,
		}
	    list.append(defesas_dic)
    context = {"trabalhos": trabalhos, "defesas": list}
    if(request.user.perfil.descricao == "Professor"):
        return  render(request, template_name, context)
    else:
        return redirect('core:home')
    
def relatorio_quantidade(request):
    trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
    defesas = DefesaTrabalho.objects.all()
    p = DefesaTrabalho.objects.values('periodo').order_by('periodo').annotate(num=Count('periodo'))
    list = []
    template_name = 'trabalhos/relatorios/view_relatorio_quantidade.html'
    context = {}
    for defesa in defesas:
	    avaliadores = defesa.trabalho.banca.all().exclude(bancatrabalho__status__contains='negado')
	    lista = []
	    for avaliador in avaliadores:
		    lista.append(avaliador.name)

	    defesas_dic = {
			'id': defesa.id,
            'periodo': defesa.periodo,
			'status': defesa.status,
		}
	    list.append(defesas_dic)
    context = {"trabalhos": trabalhos, "defesas": list, "p": p}
    if(request.user.perfil.descricao == "Coordenador"):
        return  render(request, template_name, context)
    else:
        return redirect('core:home')
    
def html_to_pdf_view_quantidade(request):
    if(request.user.perfil.descricao == "Coordenador"):
        p = DefesaTrabalho.objects.values('periodo').order_by('periodo').annotate(num=Count('periodo'))

        html_string = render_to_string('trabalhos/relatorios/quantidade_defesa.html', {'p': p})

        html = HTML(string=html_string)
        html.write_pdf(target='/tmp/relatorio_quantidade.pdf');

        fs = FileSystemStorage('/tmp')
        with fs.open('relatorio_quantidade.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="relatorio_quantidade.pdf"'
            return response

        return response
    else:
        return redirect('core:home')

def relatorio_bancas(request):
    trabalhos = Trabalhos.objects.all().filter(defesatrabalho__isnull=True)
    defesas = DefesaTrabalho.objects.values('trabalho__orientador').order_by('trabalho__orientador').annotate(num=Count('trabalho__orientador'))
    p = DefesaTrabalho.objects.values('periodo').order_by('periodo').annotate(num=Count('periodo'))
    
    template_name = 'trabalhos/relatorios/view_relacao_bancas.html'
    context = {}
    
    context = {"trabalhos": trabalhos, "defesas": defesas}
    if(request.user.perfil.descricao == "Coordenador"):
        return  render(request, template_name, context)
    else:
        return redirect('core:home')