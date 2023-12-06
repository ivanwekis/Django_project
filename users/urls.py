from . import views
from django.urls import path


urlpatterns = [
    path('users', views.create_user)
]

