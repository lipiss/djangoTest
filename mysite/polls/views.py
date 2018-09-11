from django.http import HttpResponse, HttpResponseRedirect
from django.http import Http404
from django.template import loader
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from .models import Choice, Question,Person
from django.db import connection

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)


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
    return render(request, 'polls/myownview.html', {'field1': row[0],'field2':row[1],'field3':row1[0]})
def myownview1(request):
    cursor = connection.cursor()
    cursor.execute(''' SELECT choice_text,votes FROM polls_choice ''')
    row = cursor.fetchall()
    columns = [column[0] for column in cursor.description]
    # row shows a tuple
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