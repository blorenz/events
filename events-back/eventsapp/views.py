from django.shortcuts import get_object_or_404, render_to_response
from django.http import HttpResponse
from django.template import RequestContext
from django import forms


class CreateEventibleForm(forms.Form):
    name = forms.CharField(max_length=100)    
    
    



def home(request):
    c = RequestContext(request)
    return render_to_response('eventsapp/base.html',
                              {'entry_list': 'Hi Jon!!!'},
                           context_instance=c )

def create(request):
    c = RequestContext(request)
