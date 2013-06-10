from django.db import models
from django.contrib.auth.models import User

class Stars(models.Model):
    giver        = models.IntegerField(default=0)
    receiver     = models.IntegerField(default=0)
    awardedstars = models.IntegerField(default=0)
    datetime     = models.DateTimeField()

