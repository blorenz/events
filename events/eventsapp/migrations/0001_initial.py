# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Country'
        db.create_table('eventsapp_country', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('abbreviation', self.gf('django.db.models.fields.CharField')(max_length=3)),
            ('full_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('eventsapp', ['Country'])

        # Adding model 'State'
        db.create_table('eventsapp_state', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('abbreviation', self.gf('django.db.models.fields.CharField')(max_length=2)),
            ('full_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('country', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Country'])),
        ))
        db.send_create_signal('eventsapp', ['State'])

        # Adding model 'Timezone'
        db.create_table('eventsapp_timezone', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('abbreviation', self.gf('django.db.models.fields.CharField')(max_length=5)),
            ('full_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('gmt_offset', self.gf('django.db.models.fields.DecimalField')(max_digits=4, decimal_places=2)),
        ))
        db.send_create_signal('eventsapp', ['Timezone'])

        # Adding model 'Tag'
        db.create_table('eventsapp_tag', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('text', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal('eventsapp', ['Tag'])

        # Adding model 'Location'
        db.create_table('eventsapp_location', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('city_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('state', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.State'])),
            ('postal_code', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('latitude', self.gf('django.db.models.fields.FloatField')()),
            ('longitude', self.gf('django.db.models.fields.FloatField')()),
            ('timezone', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Timezone'])),
        ))
        db.send_create_signal('eventsapp', ['Location'])

        # Adding model 'User'
        db.create_table('eventsapp_user', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Location'])),
            ('bio', self.gf('django.db.models.fields.CharField')(max_length=300)),
            ('profile_picture_path', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('show_rsvp', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('created_date', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
            ('last_updated_date', self.gf('django.db.models.fields.DateField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('eventsapp', ['User'])

        # Adding model 'UserOAuthDetail'
        db.create_table('eventsapp_useroauthdetail', (
            ('token', self.gf('django.db.models.fields.CharField')(max_length=150, primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.User'])),
            ('email_address', self.gf('django.db.models.fields.EmailField')(max_length=200)),
            ('is_default_account', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('eventsapp', ['UserOAuthDetail'])

        # Adding model 'Following'
        db.create_table('eventsapp_following', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(related_name='follower', to=orm['eventsapp.User'])),
            ('following_user', self.gf('django.db.models.fields.related.ForeignKey')(related_name='leader', to=orm['eventsapp.User'])),
        ))
        db.send_create_signal('eventsapp', ['Following'])

        # Adding model 'Eventible'
        db.create_table('eventsapp_eventible', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('start_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('end_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('venue_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('address', self.gf('django.db.models.fields.CharField')(max_length=150)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=500)),
            ('password', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('rsvp_enabled', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('created_date', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
            ('last_updated_date', self.gf('django.db.models.fields.DateField')(auto_now=True, blank=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Location'])),
            ('timezone', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Timezone'])),
            ('created_by', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.User'])),
        ))
        db.send_create_signal('eventsapp', ['Eventible'])

        # Adding model 'EventClassification'
        db.create_table('eventsapp_eventclassification', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('event', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Eventible'])),
            ('tag', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Tag'])),
        ))
        db.send_create_signal('eventsapp', ['EventClassification'])

        # Adding model 'AttendingEvent'
        db.create_table('eventsapp_attendingevent', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.User'])),
            ('event', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eventsapp.Eventible'])),
            ('will_attend', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('created_date', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
            ('last_updated_date', self.gf('django.db.models.fields.DateField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('eventsapp', ['AttendingEvent'])


    def backwards(self, orm):
        
        # Deleting model 'Country'
        db.delete_table('eventsapp_country')

        # Deleting model 'State'
        db.delete_table('eventsapp_state')

        # Deleting model 'Timezone'
        db.delete_table('eventsapp_timezone')

        # Deleting model 'Tag'
        db.delete_table('eventsapp_tag')

        # Deleting model 'Location'
        db.delete_table('eventsapp_location')

        # Deleting model 'User'
        db.delete_table('eventsapp_user')

        # Deleting model 'UserOAuthDetail'
        db.delete_table('eventsapp_useroauthdetail')

        # Deleting model 'Following'
        db.delete_table('eventsapp_following')

        # Deleting model 'Eventible'
        db.delete_table('eventsapp_eventible')

        # Deleting model 'EventClassification'
        db.delete_table('eventsapp_eventclassification')

        # Deleting model 'AttendingEvent'
        db.delete_table('eventsapp_attendingevent')


    models = {
        'eventsapp.attendingevent': {
            'Meta': {'object_name': 'AttendingEvent'},
            'created_date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'event': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Eventible']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_updated_date': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.User']"}),
            'will_attend': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        'eventsapp.country': {
            'Meta': {'object_name': 'Country'},
            'abbreviation': ('django.db.models.fields.CharField', [], {'max_length': '3'}),
            'full_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'eventsapp.eventclassification': {
            'Meta': {'object_name': 'EventClassification'},
            'event': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Eventible']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Tag']"})
        },
        'eventsapp.eventible': {
            'Meta': {'object_name': 'Eventible'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'created_by': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.User']"}),
            'created_date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '500'}),
            'end_time': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_updated_date': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Location']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'rsvp_enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'start_time': ('django.db.models.fields.DateTimeField', [], {}),
            'timezone': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Timezone']"}),
            'venue_name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'eventsapp.following': {
            'Meta': {'object_name': 'Following'},
            'following_user': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'leader'", 'to': "orm['eventsapp.User']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'follower'", 'to': "orm['eventsapp.User']"})
        },
        'eventsapp.location': {
            'Meta': {'object_name': 'Location'},
            'city_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.FloatField', [], {}),
            'longitude': ('django.db.models.fields.FloatField', [], {}),
            'postal_code': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'state': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.State']"}),
            'timezone': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Timezone']"})
        },
        'eventsapp.state': {
            'Meta': {'object_name': 'State'},
            'abbreviation': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'country': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Country']"}),
            'full_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'eventsapp.tag': {
            'Meta': {'object_name': 'Tag'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'text': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'eventsapp.timezone': {
            'Meta': {'object_name': 'Timezone'},
            'abbreviation': ('django.db.models.fields.CharField', [], {'max_length': '5'}),
            'full_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'gmt_offset': ('django.db.models.fields.DecimalField', [], {'max_digits': '4', 'decimal_places': '2'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'eventsapp.user': {
            'Meta': {'object_name': 'User'},
            'bio': ('django.db.models.fields.CharField', [], {'max_length': '300'}),
            'created_date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_updated_date': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.Location']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'profile_picture_path': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'show_rsvp': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        'eventsapp.useroauthdetail': {
            'Meta': {'object_name': 'UserOAuthDetail'},
            'email_address': ('django.db.models.fields.EmailField', [], {'max_length': '200'}),
            'is_default_account': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'token': ('django.db.models.fields.CharField', [], {'max_length': '150', 'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eventsapp.User']"})
        }
    }

    complete_apps = ['eventsapp']
