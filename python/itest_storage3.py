#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs


import json
from collections import OrderedDict

from foglamp.core.service_registry.service_registry import Service

from foglamp.storage.storage import Storage, Readings
from foglamp.storage.exceptions import *

import foglamp.storage.payload_builder as payload_builder

###  #########################################################################################:

Service.Instances.register(name="store", s_type="Storage", address="0.0.0.0", port=8080, management_port=1081)

storage = Storage()

status = storage.check_service_availibility()

print ("DBG status |{0}|".format(status))

### fetch Readings #########################################################################################:

# print("Readings::fetch_readings :")
# readings = Readings().fetch(reading_id=0, count=10)
#
# print ("DBG readings |{0}|".format(readings))

### query Readings #########################################################################################:

payload = payload_builder.PayloadBuilder() \
    .WHERE(['id', '>', 0]) \
    .ORDER_BY(['id', 'ASC'])\
    .LIMIT(300) \
    .payload()

readings2 = Readings().query(payload)
raw_data = readings2['rows']

for x in range(1,300):
    print("DBG row {} - id {}".format (x, readings2['rows'][x]['id']))

#print ("DBG readings |{0}|".format(readings2))
#print ("DBG raw_data |{0}|".format(raw_data))

###  #########################################################################################:

###  #########################################################################################: