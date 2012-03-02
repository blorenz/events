from django.db import models

class Country(models.Model):
    abbreviation = models.CharField(max_length=3)
    full_name = models.CharField(max_length=100)

class State(models.Model):
    abbreviation = models.CharField(max_length=2)
    full_name = models.CharField(max_length=100)
    country = models.ForeignKey(Country)

class Timezone(models.Model):
    abbreviation = models.CharField(max_length=5)
    full_name = models.CharField(max_length=100)
    gmt_offset = models.DecimalField(max_digits=4, decimal_places=2)

class Tag(models.Model):
    text = models.CharField(max_length=50)

class Location(models.Model):
    city_name = models.CharField(max_length=100)
    state = models.ForeignKey(State)
    postal_code = models.CharField(max_length=10)
    latitude = models.FloatField()
    longitude = models.FloatField()
    timezone = models.ForeignKey(Timezone)

class EpUser(models.Model):
    name = models.CharField(max_length=100)
    location = models.ForeignKey(Location)
    bio = models.CharField(max_length=300)
    profile_picture_path = models.CharField(max_length=200)
    show_rsvp = models.BooleanField()
    created_date = models.DateField(auto_now_add=true)
    last_updated_date = models.DateField(auto_now=true)

class EpUserOAuthDetail(models.Model):
    token = models.CharField(max_length=150,primary_key=true)
    ep_user = models.ForeignKey(EpUser)
    email_address = models.EmailField(max_length=200)
    is_default_account = models.BooleanField()

class Following(models.Model):
    ep_user = models.ForeignKey(EpUser)
    following_ep_user = models.ForeignKey(EpUser)

class EventDetail(models.Model):
    name = models.CharField(max_length=100)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    venue_name = models.CharField(max_length=100)
    address = models.CharField(max_length=150)
    description = models.CharField(max_length=500)
    password = models.CharField(max_length=50)
    rsvp_enabled = models.BooleanField()
    created_date = models.DateField(auto_now_add=true)
    last_updated_date = models.DateField(auto_now=true)
    location = models.ForeignKey(Location)
    timezone = models.ForeignKey(Timezone)
    created_by = models.ForeignKey(EpUser)

class EventComment(models.Model):
    ep_user = models.ForeignKey(EpUser)
    event = models.ForeignKey(EventDetail)
    text = models.CharField(max_length=100)
    created_date = models.DateField(auto_now_add=true)
    last_updated_date = models.DateField(auto_now=true)

class EventClassification(models.Model):
    event = models.ForeignKey(EventDetail)
    tag = models.ForeignKey(Tag)

class AttendingEvent(models.Model):
    ep_user = models.ForeignKey(EpUser)
    event = models.ForeignKey(EventDetail)
    will_attend = models.BooleanField()
    created_date = models.DateField(auto_now_add=true)
    last_updated_date = models.DateField(auto_now=true)    