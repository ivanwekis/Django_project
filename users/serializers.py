from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'email', 'date_created', 'date_of_birth')
        read_only_fields = ('id', 'date_created')
