# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible
from django.shortcuts import render

from core.mail import send_mail_template
from core.utils import generate_hash_key
from trabalhos.models import Trabalhos, DefesaTrabalho, BancaTrabalho
from .models import EmailParticipacaoBanca

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from datetime import date

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

class EnviaEmailParticipacaoBanca(APIView):

    def post(self, request, pk, format=None):
        trabalho = Trabalhos.objects.get(pk=pk)
        key = generate_hash_key(request.user.username)
        email_participacao_banca = EmailParticipacaoBanca(
            remetente=request.user,
            destinatario=trabalho.orientador,
            key=key,
            trabalho=trabalho,
            tipo='pedido de participação'
        )
        base_url = request.scheme + "://" + request.get_host()
        email_participacao_banca.save()
        template_name = 'mensagem/banca/pedido_participacao_banca.html'
        subject = 'Solitação para compor a banca do trabalho ' + unicode(trabalho.titulo)
        context = {'trabalho': trabalho, 'base_url': base_url, 'key': key, 'avaliador': request.user}
        send_mail_template(subject, template_name, context, [trabalho.orientador.email], request.user.email)
        return Response(status=status.HTTP_204_NO_CONTENT)

def confirmada_participacao_banca(request, key):

        participacao_banca = get_object_or_404(EmailParticipacaoBanca, key=key)

        if participacao_banca.visualizada:
            messages.error(request, 'Esta mensagem já foi respondida')
            return redirect('core:home')
        else:
            if participacao_banca.tipo == 'pedido de participação':
                banca = BancaTrabalho.objects.create(
                    usuario=participacao_banca.remetente,
                    trabalho=participacao_banca.trabalho,
                    status='aceito_pelo_orientador'
                )
                template_name = 'mensagem/banca/solicitacao_aceita.html'
                subject = 'Solitação aceita para compor a banca do trabalho ' + unicode(participacao_banca.trabalho.titulo)
                usuario = participacao_banca.remetente
            else:
                banca = BancaTrabalho.objects.filter(trabalho=participacao_banca.trabalho, usuario=participacao_banca.destinatario)
                if not banca:
                    banca = BancaTrabalho.objects.create(
                        usuario=participacao_banca.destinatario,
                        trabalho=participacao_banca.trabalho,
                        status='aceito_pelo_avaliador'
                    )
                else:
                    banca.update(status='aceito_pelo_avaliador')
                template_name = 'mensagem/banca/convite_aceito.html'
                subject = 'Convite aceito para compor a banca do trabalho ' + unicode(participacao_banca.trabalho.titulo)
                usuario = participacao_banca.destinatario

            base_url = request.scheme + "://" + request.get_host()

            #dispara email de resposta
            context = {'trabalho': participacao_banca.trabalho,
                       'usuario' : usuario,
                       'base_url': base_url}
            send_mail_template(
                subject,
                template_name,
                context,
                [participacao_banca.remetente.email]
            )
            participacao_banca.visualizada = date.today()
            participacao_banca.save()
            avaliadores = BancaTrabalho.objects.filter(trabalho=participacao_banca.trabalho, status__contains='aceito')
            defesa = DefesaTrabalho.objects.filter(trabalho=participacao_banca.trabalho)
            if avaliadores.count() >= 2 and defesa and defesa.status == 'pendente_banca_avaliadora':
                defesa.update(status='agendado')
                subject = 'Confirmada a defesa de ' + unicode(defesa.trabalho.titulo)
                template_name = 'mensagem/banca/confirmado_agendamento_defesa.html'
                context = {'trabalho': defesa.trabalho, 'defesa': defesa, 'avaliadores': avaliadores}
                for avaliador in avaliadores:
                    send_mail_template(
                        subject,
                        template_name,
                        context,
                        [avaliador.usuario.email]
                    )

            return redirect('core:home')

def rejeitada_participacao_banca(request, key):

    participacao_banca = get_object_or_404(EmailParticipacaoBanca, key=key)

    #verifica se a mensagem já foi visualizada
    if participacao_banca.visualizada:
        messages.error(request, 'Esta mensagem já foi respondida')
        return redirect('core:home')
    else:
        #verifica se foi uma solicitação feita por algum professor ou aluno para participar da banca ou se foi
        # um convite do orientador a algum professou ou aluno para compor a banca
        if participacao_banca.tipo == 'pedido de participação':
            banca = BancaTrabalho(
                usuario=participacao_banca.remetente,
                trabalho=participacao_banca.trabalho,
            )
            banca.status = 'negado_pelo_orientador'
            template_name = 'mensagem/banca/solicitacao_rejeitado.html'
            subject = 'Solitação rejeitada para compor a banca de avaliação do trabalho ' + unicode(participacao_banca.trabalho.titulo)
        else:
            banca = BancaTrabalho.objects.get(trabalho=participacao_banca.trabalho,
                                              usuario=participacao_banca.destinatario)
            banca.status = 'negado_pelo_avaliador'
            template_name = 'mensagem/banca/convite_rejeitado.html'
            subject = 'Convite rejeitado para compor a banca de avaliação do trabalho ' + unicode(participacao_banca.trabalho.titulo)

        banca.save()
        base_url = request.scheme + "://" + request.get_host()
        # dispara email de resposta ao orientador ou ao professor/aluno informando que o pedido/convite foi rejeitado
        context = {'trabalho': participacao_banca.trabalho,
                   'usuario': participacao_banca.remetente,
                   'base_url': base_url}
        send_mail_template(
            subject,
            template_name,
            context,
            [participacao_banca.remetente.email]
        )
        participacao_banca.visualizada = date.today()
        participacao_banca.save()
        return redirect('core:home')