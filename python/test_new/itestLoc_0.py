#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

import datetime

#from datetime import datetime, timezone

# time_stamp = datetime.datetime.now(tz=datetime.timezone.utc)

time_stamp = datetime.datetime.now()

time_stamp1 = datetime.datetime.utcnow()

print ("  DBG BRK 1 ")

print (" DBG time_stamp |{0}|".format(time_stamp) )
print (" DBG time_stamp1 |{0}|".format(time_stamp1) )
