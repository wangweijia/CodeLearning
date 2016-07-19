"""test01 URL Configuration
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

from .import views

urlpatterns = [
	url(r'^$', views.post_list, name='list'),
	url(r'^create/$', views.post_create),
	url(r'^detail/(?P<id>\d)/$', views.post_detail, name='detail'),
	url(r'^(?P<id>\d)/edit/$', views.post_update, name='update'),
	url(r'^delete/(?P<id>\d)/$', views.post_delete),
]