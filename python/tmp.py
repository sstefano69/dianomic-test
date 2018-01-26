
import datetime
import pytz

print ("Date 1 {}".format(datetime.datetime.now(tz=datetime.timezone.utc ) ))

print ("Date 1 {}".format(datetime.datetime.utcnow() ))
print ("Date 2 {}".format(datetime.datetime.now() ))

delta = datetime.timedelta(hours=2)

print ("Date 1 {}".format(datetime.datetime.now(tz=datetime.timezone(delta))))

print ("Date 3 {}".format(datetime.datetime.now(tz=pytz.timezone('US/Pacific' )) ))
print ("Date 4 {}".format(datetime.datetime.now(tz=pytz.UTC) ))

# v = datetime.timezone(delta)

# print ("Date 2 {}".format(v.tzname(delta)))

for tz in pytz.all_timezones:
    print("Timezone {}".format(tz))

print ("Test")





