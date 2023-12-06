"""Main file for the logic of the users app."""
from rest_framework.decorators import api_view
from .models import User

@api_view(['POST'])
def create_user():
    """Create a user."""
    user = User.objects.create()
    return "Hello World"
