from django.http import HttpResponse
from rest_framework import mixins
from rest_framework.generics import GenericAPIView

from .models import Carrera, Profesor
from .serializers import CarreraSerializer, ProfesorSerializer


def index(request):
	return HttpResponse("App aulas funcionando")


class CarreraMixin(mixins.ListModelMixin, mixins.CreateModelMixin, GenericAPIView):
	queryset = Carrera.objects.all()
	serializer_class = CarreraSerializer

	def get(self, request, *args, **kwargs):
		return self.list(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		return self.create(request, *args, **kwargs)


class ProfesorMixinDetail(
	mixins.RetrieveModelMixin,
	mixins.UpdateModelMixin,
	mixins.DestroyModelMixin,
	GenericAPIView,
):
	queryset = Profesor.objects.all()
	serializer_class = ProfesorSerializer

	def get(self, request, *args, **kwargs):
		return self.retrieve(request, *args, **kwargs)

	def put(self, request, *args, **kwargs):
		return self.update(request, *args, **kwargs)

	def patch(self, request, *args, **kwargs):
		return self.partial_update(request, *args, **kwargs)

	def delete(self, request, *args, **kwargs):
		return self.destroy(request, *args, **kwargs)
