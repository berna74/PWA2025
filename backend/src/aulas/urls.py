from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='aulas-index'),
    path('carreras/', views.CarreraMixin.as_view(), name='carreras-list-create'),
    path('profesores/<int:pk>/', views.ProfesorMixinDetail.as_view(), name='profesores-detail'),
]
