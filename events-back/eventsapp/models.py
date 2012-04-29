from django.db import models

class Country(models.Model):
    abbreviation = models.CharField(max_length=3)
    full_name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.full_name

    class Meta:
        ordering = ['full_name']
        
class State(models.Model):
    abbreviation = models.CharField(max_length=2)
    full_name = models.CharField(max_length=100)
    country = models.ForeignKey(Country)
    
    def __unicode__(self):
        return self.full_name
    class Meta:
        ordering = ['full_name']

class Timezone(models.Model):
    abbreviation = models.CharField(max_length=5)
    full_name = models.CharField(max_length=100)
    gmt_offset = models.DecimalField(max_digits=4, decimal_places=2)

    def __unicode__(self):
        return "%s (%d GMT)" % (self.full_name, self.gmt_offset,)
    class Meta:
        ordering = ['gmt_offset']
    
class Tag(models.Model):
    text = models.CharField(max_length=50)

    def __unicode__(self):
        return self.text

class Location(models.Model):
    city_name = models.CharField(max_length=100)
    state = models.ForeignKey(State)
    postal_code = models.CharField(max_length=10)
    latitude = models.FloatField()
    longitude = models.FloatField()
    timezone = models.ForeignKey(Timezone)

    def __unicode__(self):
        return "%s (%s, %s)" % (self.postal_code, self.city_name, self.state,)

    class Meta:
        ordering = ['postal_code']

class User(models.Model):
    name = models.CharField(max_length=100)
    location = models.ForeignKey(Location)
    bio = models.CharField(max_length=300)
    profile_picture_path = models.CharField(max_length=200)
    show_rsvp = models.BooleanField()
    created_date = models.DateField(auto_now_add=True)
    last_updated_date = models.DateField(auto_now=True)

    def __unicode__(self):
        return self.name

class UserOAuthDetail(models.Model):
    token = models.CharField(max_length=150,primary_key=True)
    user = models.ForeignKey(User)
    email_address = models.EmailField(max_length=200)
    is_default_account = models.BooleanField()

class Following(models.Model):
    user = models.ForeignKey(User, related_name='follower')
    following_user = models.ForeignKey(User, related_name='leader')

class Eventible(models.Model):
    name = models.CharField(max_length=100)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    venue_name = models.CharField(max_length=100)
    address = models.CharField(max_length=150)
    description = models.CharField(max_length=500)
    password = models.CharField(max_length=50)
    rsvp_enabled = models.BooleanField()
    created_date = models.DateField(auto_now_add=True)
    last_updated_date = models.DateField(auto_now=True)
    location = models.ForeignKey(Location,editable=False)
    timezone = models.ForeignKey(Timezone)
    created_by = models.ForeignKey(User)
    
    def __unicode__(self):
        return "%s by %s" % (self.name, self.created_by.name)

#class EventComment(models.Model):
#    user = models.ForeignKey(User)
#    event = models.ForeignKey(Eventible)
#    text = models.CharField(max_length=100)
#    created_date = models.DateField(auto_now_add=True)
#    last_updated_date = models.DateField(auto_now=True)

class EventClassification(models.Model):
    event = models.ForeignKey(Eventible)
    tag = models.ForeignKey(Tag)

class AttendingEvent(models.Model):
    user = models.ForeignKey(User)
    event = models.ForeignKey(Eventible)
    will_attend = models.BooleanField()
    created_date = models.DateField(auto_now_add=True)
    last_updated_date = models.DateField(auto_now=True)    

