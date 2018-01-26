#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import datetime

str_time = "2018-01-22 20:48:45.462506+05:30"

str_time_part = str_time.split('.')[1]

if '+' in str_time_part:
    sign = '+'
else:
    sign = '-'

time = str_time_part.split(sign)[1]
hours= time.split(":")[0]
minutes= time.split(":")[1]

delta = datetime.timedelta(hours=int(sign + hours),minutes=int(minutes))
delta_utc = datetime.timedelta(hours=0,minutes=0)

#tmp_timestamp = '%Y-%m-%d %H:%M:%S.%f{}{}:{}'.format(sign, hours, minutes)
#step1 = datetime.datetime.strptime(str_time, tmp_timestamp)

str_time_0 = str_time.split('.')[0]
str_time_1 = str_time.split('.')[1]

str_time = str_time_0 + "." + str_time_1.replace(":","")


tmp_timestamp = '%Y-%m-%d %H:%M:%S.%f%z'
step1 = datetime.datetime.strptime(str_time, tmp_timestamp)

step2 = step1.replace(tzinfo=datetime.timezone(delta))
utc_dt = step2.astimezone (tz=datetime.timezone(delta_utc))

timestamp_iso = utc_dt.isoformat() + 'Z'

print ("str_time {}".format(str_time))
print ("delta {}".format(delta))
print ("step1 {}".format(step1))
print ("utc_dt {}".format(utc_dt))
print ("timestamp_iso {}".format(timestamp_iso))


