from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.index, name='index'),  
    path('myownview/', views.myownview, name='myownview'),
    path('myownview1/', views.myownview1, name='myownview1'),
    path('<int:question_id>/detail/', views.detail, name='detail'),
    path('<int:question_id>/results/', views.results, name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
    path('pullsectorlocation/', views.pullsectorlocation, name='pullsectorlocation'),
    path('simple_upload/', views.simple_upload, name='simple_upload'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)