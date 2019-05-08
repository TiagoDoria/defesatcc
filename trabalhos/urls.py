from django.conf.urls import url
from . import views

urlpatterns = [
    # Examples:
    url(r'^cadastrar-trabalho/novo$', views.cadastrar_trabalho, name='cadastrar_trabalho'),
    url(r'^detalhe/(?P<pk>\d+)/$', views.detalhe, name='detalhe'),
    url(r'^editar/(?P<pk>\d+)/$', views.TrabalhoUpdateView.as_view(), name='editar'),
    url(r'^(?P<pk>\d+)/$', views.TrabalhoDetail.as_view(), name='deletar'),
    url(r'^agendamento/novo/(?P<pk>\d+)/$', views.defesatrabalho, name='cadastrar_agendamento_defesa'),
    url(r'^banca-trabalho/(?P<pk>\d+)/$', views.banca_trabalho, name='banca_trabalho'),
    url(r'^deletar-agendamento/(?P<pk>\d+)/$', views.AgendamentoDetail.as_view(), name='deletar_agendamento'),
    url(r'^detalhe-agendamento/(?P<pk>\d+)/$', views.AgendamentoDetail.as_view(), name='detalhe_agendamento'),
    url(r'^banca_pendente/ver$', views.banca_pendente, name='banca_pendente'),
    url(r'^agendamentos_pendentes/$', views.agendamento_pendente, name='agendamentos_pendentes'),
    url(r'^defesas_confirmadas/$', views.defesas_confirmadas, name='defesas_confirmadas'),
    url(r'^relatorio_defesas/$', views.html_to_pdf_view, name='relatorio_defesas'),
]
