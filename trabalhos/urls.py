from django.conf.urls import url
from . import views

urlpatterns = [
    # Examples:
    url(r'^cadastrar-trabalho/novo$', views.cadastrar_trabalho, name='cadastrar_trabalho'),
    url(r'^detalhe/(?P<pk>\d+)/$', views.detalhe, name='detalhe'),
    url(r'^editar/(?P<pk>\d+)/$', views.TrabalhoUpdateView.as_view(), name='editar'),
    url(r'^deletar/(?P<pk>\d+)/$', views.deletar_trabalho, name='deletar'),
    url(r'^deletar_agendamento/(?P<pk>\d+)/$', views.deletar_agendamento, name='deletar_agendamento'),
    url(r'^agendamento/novo/(?P<pk>\d+)/$', views.defesatrabalho, name='cadastrar_agendamento_defesa'),
    url(r'^banca-trabalho/(?P<pk>\d+)/$', views.banca_trabalho, name='banca_trabalho'),
    url(r'^banca_pendente/ver$', views.banca_pendente, name='banca_pendente'),
    url(r'^agendamentos_pendentes/$', views.agendamento_pendente, name='agendamentos_pendentes'),
    url(r'^defesas_confirmadas/$', views.defesas_confirmadas, name='defesas_confirmadas'),
    url(r'^relatorio_defesas/$', views.relatorio_defesa, name='relatorio_defesas'),
    url(r'^relatorio_membro/$', views.relatorio_membro, name='relatorio_membro'),
    url(r'^relatorio_bancas/$', views.relatorio_bancas, name='relatorio_bancas'),
    url(r'^relatorio_quantidade/$', views.relatorio_quantidade, name='relatorio_quantidade'),
    url(r'^download_relatorio_defesas/$', views.html_to_pdf_view_defesa, name='download_relatorio_defesas'),
    url(r'^download_relatorio_membro/$', views.html_to_pdf_view_membro, name='download_relatorio_membro'),
    url(r'^download_relatorio_quantidade/$', views.html_to_pdf_view_quantidade, name='download_relatorio_quantidade'),
    url(r'^relatorio_orientador/(?P<pk>\d+)/$', views.relatorio_orientador, name='relatorio_orientador'),
    url(r'^confirmar_defesa/(?P<pk>\d+)/$', views.confirmar_defesa, name='confirmar_defesa'),
    url(r'^lista_bancas/$', views.lista_bancas, name='lista_bancas'),
    
]
