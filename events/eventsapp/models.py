# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class Timezone(models.Model):
    id = models.IntegerField(primary_key=True)
    abbreviation = models.CharField(max_length=15, blank=True)
    full_name = models.CharField(max_length=300, blank=True)
    gmt_offset = models.DecimalField(null=True, max_digits=6, decimal_places=2, blank=True)
    class Meta:
        db_table = u'timezone'

class Country(models.Model):
    id = models.IntegerField(primary_key=True)
    abbreviation = models.CharField(max_length=9)
    full_name = models.CharField(max_length=300)
    class Meta:
        db_table = u'country'

class State(models.Model):
    id = models.IntegerField(primary_key=True)
    abbreviation = models.CharField(max_length=6)
    full_name = models.CharField(max_length=300)
    class Meta:
        db_table = u'state'

class Location(models.Model):
    id = models.IntegerField(primary_key=True)
    city_name = models.CharField(max_length=300)
    state = models.ForeignKey(State)
    postal_code = models.CharField(max_length=30)
    country = models.ForeignKey(Country)
    latitude = models.FloatField()
    longitude = models.FloatField()
    timezone = models.ForeignKey(Timezone)
    class Meta:
        db_table = u'location'

class EpUser(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    location = models.ForeignKey(Location)
    bio = models.CharField(max_length=900, blank=True)
    profile_picture_path = models.CharField(max_length=600, blank=True)
    show_rsvp = models.TextField() # This field type is a guess.
    created_date = models.DateTimeField()
    last_updated_date = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'ep_user'

class EventDetails(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    venue_name = models.CharField(max_length=300, blank=True)
    address = models.CharField(max_length=450, blank=True)
    description = models.CharField(max_length=1500, blank=True)
    password = models.CharField(max_length=150, blank=True)
    rsvp_enabled = models.TextField() # This field type is a guess.
    created_date = models.DateTimeField()
    last_updated_date = models.DateTimeField(null=True, blank=True)
    location = models.ForeignKey(Location, null=True, blank=True)
    timezone = models.ForeignKey(Timezone)
    class Meta:
        db_table = u'event_details'

class AttendingEvent(models.Model):
    ep_user = models.ForeignKey(EpUser)
    event = models.ForeignKey(EventDetails)
    will_attend = models.IntegerField(null=True, blank=True)
    created_date = models.DateTimeField()
    last_updated_date = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'attending_event'

class EpUserOauthDetails(models.Model):
    token = models.CharField(max_length=255, primary_key=True)
    ep_user = models.ForeignKey(EpUser)
    email_address = models.CharField(max_length=600)
    is_default_account = models.TextField() # This field type is a guess.
    class Meta:
        db_table = u'ep_user_oauth_details'

class Tag(models.Model):
    id = models.IntegerField(primary_key=True)
    tag_text = models.CharField(max_length=150)
    class Meta:
        db_table = u'tag'

class EventClassification(models.Model):
    event = models.ForeignKey(EventDetails)
    tag = models.ForeignKey(Tag)
    class Meta:
        db_table = u'event_classification'

class EventComment(models.Model):
    id = models.IntegerField(primary_key=True)
    ep_user = models.ForeignKey(EpUser)
    event = models.ForeignKey(EventDetails)
    comment_text = models.CharField(max_length=300)
    created_date = models.DateTimeField()
    last_updated_date = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'event_comment'

class Following(models.Model):
    ep_user = models.ForeignKey(EpUser, related_name="ep_user")
    following_ep_user = models.ForeignKey(EpUser, related_name="following_ep_user")
    class Meta:
        db_table = u'following'

class MobileDevice(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    class Meta:
        db_table = u'mobile_device'

class MobileDeviceUserAgent(models.Model):
    mobile_device = models.ForeignKey(MobileDevice)
    user_agent = models.CharField(max_length=1500)
    class Meta:
        db_table = u'mobile_device_user_agent'



