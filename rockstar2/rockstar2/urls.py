from django.conf.urls import patterns, include, url
#from django.views.generic.simple import direct_to_template
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.conf import settings

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'rockstar2.views.home', name='home'),
    # url(r'^rockstar2/', include('rockstar2.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    #url(r'^login/$', 'django_openid_auth.views.login_begin', name='openid-login'),
    url(r'^login/$', 'rsuser.views.LoginRequest'),
    url(r'^logout/$', 'rsuser.views.LogoutRequest'),
    url(r'^profile/$', 'rsuser.views.profile'),
    url(r'^award_star/$', 'rsuser.views.award_stars'),
    url(r'^update_scores/$', 'rsuser.views.update_scores'),
    url(r'^login-complete/$', 'django_openid_auth.views.login_complete', name='openid-complete'),
    url(r'^logout/$', 'django.contrib.auth.views.logout', {'next_page': '/',}, name='logout')
                     
)
