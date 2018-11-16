from django.http import HttpResponse, HttpResponseRedirect
from django.http import Http404
from django.template import loader
from django.template.loader import render_to_string
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.core.files.storage import FileSystemStorage
from .forms import UploadFileForm
from django.db import connection, connections
from .models import Choice, Question,Person
import os, pandas


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)
def simple_upload(request):
    if request.method == 'POST' and request.FILES['myfile']:
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)
        return render(request, 'polls/simple_upload.html', {
            'uploaded_file_url': uploaded_file_url
        })
    return render(request, 'polls/simple_upload.html')

def myownview(request):
    #latest_question_list = Question.objects.order_by('-pub_date')[:5]
    #context = {'latest_question_list': latest_question_list}
    # return render(request, 'polls/myownview.html', context)
    cursor = connection.cursor()
    # cursor.execute(''' SELECT * FROM polls_choice ''')
    cursor.execute(''' SELECT choice_text,votes FROM polls_choice ''')
    row = cursor.fetchone()
    row1 = cursor.fetchone()
    ##Person.objects.raw('SELECT id,choice_text,votes FROM polls_choice')[0]
    #os.path.join(os.getcwd(),'polls\file')
    fo = open(os.path.join(os.getcwd(),'polls/xxxxxxxxxxx'), "wb")
    fo.close()
    return render(request, 'polls/myownview.html', {'field1': row[0],'field2':row[1],'field3':row1[0],'field4':os.path.join(os.getcwd(),'polls','file')})
def pullsectorlocation(request):
    # change default database to other non-default database.
    with connections['oselimw0204v.int.msdp.ericsson.se'].cursor() as cursor:
        #cursor = connections.cursor()
        cursor.execute('''
        SELECT
        o3.name   AS 'BSC/RNC NAME',
        o2.name AS 'SITE/NODEB NAME',
        SUBSTRING_INDEX(o2.name, '-',-1) as enodeB,
        cc.EUtranCellFDDId as EUtranCellFDDId,
        o1.name  AS 'SECTOR/CELL NAME',
        cc.GCID                 AS 'SECTOR/CELL GLOBAL ID',
        '4G'                     AS 'TECHNOLOGY(2G/3G/4G)',
        o1.vertical_loc/10e6   AS LATITUDE,
        o1.horizontal_loc/10e6 AS LONGITUDE,
        cc.azimuth              AS AZIMUTH,
        cc.BeamWidth            AS BEAM_WIDTH,
        cc.MTILT                AS MTILT,
        cc.earfcndl,
        3*cc.physicalLayerCellIdGroup+physicalLayerSubCellId as PCI
        FROM
        c_ecell cc
        LEFT JOIN
        timeslice_cm tc
        ON
        tc.timeslice_id = cc.timeslice_id
        LEFT JOIN
        objects o1
        ON
        o1.timeslice_id = tc.timeslice_id
        AND
        o1.int_id = cc.int_id
        LEFT JOIN
        objects o2
        ON
        o2.timeslice_id = tc.timeslice_id
        AND
        o1.parent_int_id = o2.int_id
        LEFT JOIN
        objects o3
        ON
        o3.timeslice_id = tc.timeslice_id
        AND
        o2.parent_int_id = o3.int_id
        WHERE
        cc.timeslice_id=tc.timeslice_id
        AND
        tc.period_start = (SELECT MAX(period_start) FROM timeslice_cm)
        /*AND cc.EUtranCellFDDId <> o1.name*/
        ORDER BY 
        1,2,3
        ''')
        row = cursor.fetchall()
    
    columns = [column[0] for column in cursor.description]
# row shows a tuple
    os.getcwd()
    rendered = render_to_string('polls/pullsectorlocation.html', {'result': row,'columns': columns})
    f = open('polls/rendered.html', 'w',encoding="utf-8")
    f.write(rendered)
    f.close()
    return render(request, 'polls/pullsectorlocation.html', {'result': row,'columns': columns})
def myownview1(request):
    cursor = connection.cursor()
    cursor.execute(''' SELECT choice_text,votes FROM polls_choice ''')
    row = cursor.fetchall()
    columns = [column[0] for column in cursor.description]
# row shows a tuple
    os.getcwd()
    return render(request, 'polls/myownview1.html', {'result': row,'columns': columns})
# def myownview(request):
    # latest_question_list = Question.objects.order_by('-pub_date')[:5]
    # context = {'latest_question_list': latest_question_list}
    # Person.objects.raw('SELECT id,choice_text,votes FROM polls_choice')[0]
    # return render(request, 'polls/myownview.html', {'Person': Person})
def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})



	
	
def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
        # return HttpResponseRedirect(reverse('polls:index'))

        # latest_question_list = Question.objects.order_by('-pub_date')[:5]
        # context = {'latest_question_list': latest_question_list}
        # return render(request, 'polls/index.html')