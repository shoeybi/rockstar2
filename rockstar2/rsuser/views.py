# auth/views.py
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.template import RequestContext
from rsuser.models import RsUser, Stars
from rsuser.forms import LoginForm, AwardingForm
from django.contrib.auth import authenticate, login, logout
from django.conf import settings
from datetime import datetime
from django.views.decorators.csrf import csrf_protect
from rsuser.GraphAlgorithms import Hits

def LoginRequest(request):
	if request.user.is_authenticated():
		return HttpResponseRedirect('/profile/')
	if request.method == 'POST':
		form = LoginForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data['username']
			password = form.cleaned_data['password']
			rsuser = authenticate(username=username, password=password)
			if rsuser is not None:
				login(request, rsuser)
				return HttpResponseRedirect('/profile/')
			else:
				return render_to_response('login.html', {'state': "MESSAGE", 'username': username})
		else:
			return render_to_response('login.html', {'state': "MESSAGE", 'username': username})
	else:
		''' user is not submitting the form, show the login form '''
		form = LoginForm()
		context = {'form': form}
		return render_to_response('login.html', context, context_instance=RequestContext(request))
	
def LogoutRequest(request):
	logout(request)
	return HttpResponseRedirect('/login')	

def profile(request):
        if request.user.is_authenticated():
		rsuser = RsUser.objects.get(user=request.user)
                return render_to_response('profile.html', {'user_name': rsuser.user.username, 'star_earned': rsuser.starsEarned, 'star_avail': rsuser.starsAvail})
        else:
                return HttpResponseRedirect('/login') 

class starPair:
    def __init__(self):
        self.giver = None
        self.receiver = None
        self.awardedstars = 0

def update_scores(request):
	stars_list    = Stars.objects.all()
	rows = []
	for stars in stars_list:
		userG = User.objects.filter(id=stars.giver)
		userR = User.objects.filter(id=stars.receiver)
		rsuserg = RsUser.objects.get(user=userG)
		rsuserr = RsUser.objects.get(user=userR)
		row = starPair()
		row.giver = rsuserg.user.username
		row.receiver = rsuserr.user.username
		row.awadedstars = stars.awardedstars 
		rows.append(row)
	rankedUsers= Hits(rows)
	return render_to_response('update_scores.html', {'ranked_users': rankedUsers})

def award_stars(request):
	if request.user.is_authenticated():
		if request.method == 'POST':
			form = AwardingForm(request.POST)
			if form.is_valid():
				award_stars = form.cleaned_data['awardingstars']
				rsuserg = RsUser.objects.get(user=request.user)
				rsuserg.starsAvail = rsuserg.starsAvail - award_stars 
				rsuserg.save()
				receiver  = form.cleaned_data['usernamer']
				userr = User.objects.get(username=receiver)
				rsuserr = RsUser.objects.get(user=userr)
				rsuserr.starsEarned = rsuserr.starsEarned + award_stars
                                rsuserr.save()
				stars = Stars(giver=request.user.id, receiver=userr.id, awardedstars=award_stars)
				stars.datetime = datetime.today()
				stars.save()
				#print userr.id
				#print award_stars
				#print receiver
				return HttpResponseRedirect('/profile')
			else:
				print 'form not valid'
				return HttpResponseRedirect('/logout')
		else:
			rsuser = RsUser.objects.get(user=request.user)
			culture_list = ['Communication','Passion', 'Impact','Innovation','Fun','Courage','Curiosity','Judgment','Honesty','Selflessness']
			user_list    = RsUser.objects.all()
			form = AwardingForm()
			return render_to_response('point_award.html', {'user_id': rsuser.user.id, 'form': form, 'stars_avail': rsuser.starsAvail, 'culture_list': culture_list, 'user_list': user_list}, context_instance=RequestContext(request))
	else:
		return HttpResponseRedirect('/login')
