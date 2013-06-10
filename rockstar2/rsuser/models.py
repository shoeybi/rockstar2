from django.db import models
from django.contrib.auth.models import User

class RsUser(models.Model):
    user        = models.OneToOneField(User)
    starsEarned = models.IntegerField(default=0)
    starsAvail  = models.IntegerField(default=0)
    def __unicode__(self):
        return self.user.username


class Stars(models.Model):
    giver        = models.IntegerField(default=0)
    receiver     = models.IntegerField(default=0)
    awardedstars = models.IntegerField(default=0)
    datetime     = models.DateTimeField()
    #culture     = models.CharField(max_length=50)
