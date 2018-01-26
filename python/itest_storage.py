#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs


import json
from collections import OrderedDict

from foglamp.core.service_registry.service_registry import Service

from foglamp.storage.storage import Storage, Readings
from foglamp.storage.exceptions import *


###  #########################################################################################:
# register the service to test the code

class StorageNoInit(Storage):
    def __init__(self):
        pass

storage = StorageNoInit()

Service.Instances.register(name="store", s_type="Storage", address="0.0.0.0", port=8080, management_port=1081)

storage = Storage()

status = storage.check_service_availibility()

print ("DBG status |{0}|".format(status))

### Read Readings #########################################################################################:

print("Readings::fetch_readings :")
readings = Readings().fetch(reading_id=1201, count=2)

print ("DBG readings |{0}|".format(readings))

### streams Update #########################################################################################:
#            sql_cmd = "UPDATE foglamp.streams SET last_object={0}, ts=now()  WHERE id={1}" \
#                .format(new_last_object_id, stream_id)

condition = dict()
condition['column'] = 'id'
condition['condition'] = '='
condition['value'] = 1

values = dict()
values['last_object'] = 2000
values['ts'] = 'now()'

data = dict()
data['condition'] = condition
data['values'] = values

streams = storage.update_tbl("streams", json.dumps(data))
print ("DBG UPDATE streams |{0}|".format(streams))

### streams Read  #########################################################################################:

#sql_cmd = "SELECT last_object FROM foglamp.streams WHERE id={0}".format(stream_id)

q = 'id=1'
streams = storage.query_tbl('streams', q)

print ("DBG READ streams |{0}|".format(streams))
print ("DBG last_object |{0}|".format(streams['rows'][0]['last_object']))
print ("DBG description |{0}|".format(streams['rows'][0]['description']))
print ("DBG ts |{0}|".format(streams['rows'][0]['ts']))

### INSERT omf_created_objects #########################################################################################:

# sql_cmd = "INSERT INTO foglamp.omf_created_objects  " \
#           "(configuration_key, asset_code, type_id) " \
#           "VALUES ('{0}', '{1}', {2})".format(configuration_key,
#                                               asset_code,
#                                               type_id)

print("Storage::insert_data :")
data = dict()

data['configuration_key'] = 'OMF_TR_2'
data['asset_code'] = 'x'
data['type_id'] =1

omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))

print("Storage::insert_data :")
data = dict()

data['configuration_key'] = 'OMF_TR_2'
data['asset_code'] = 'x'
data['type_id'] = 2

omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))



### SELCT omf_created_objects #########################################################################################:

#sql_cmd = "SELECT asset_code FROM foglamp.omf_created_objects " \
#          "WHERE configuration_key='{0}' and type_id={1}".format(configuration_key, type_id)


where = OrderedDict()
where['column'] = 'configuration_key'
where['condition'] = '='
where['value'] = 'OMF_TR_2'

# verify AND / OR?
where_2 = OrderedDict()
where_2['column'] = 'type_id'
where_2['condition'] = '='
where_2['value'] = 1

aggregate = OrderedDict()
aggregate['operation'] = 'min'
aggregate['column'] = 'value'

query_payload = OrderedDict()
query_payload['where'] = where
query_payload['and'] = where_2

payload = json.dumps(query_payload)
print ("DBG payload |{0}|".format(payload))

omf_created_objects = storage.query_tbl_with_payload('omf_created_objects', payload)
print ("DBG SELECT omf_created_objects|{0}|".format(omf_created_objects))


### DELETE omf_created_objects #########################################################################################:

# sql_cmd = "DELETE FROM foglamp.omf_created_objects " \
#           "WHERE configuration_key='{0}' AND type_id={1}".format(config_category_name, type_id)

# payload as per doc,
# see: Plugin Common Delete
del_cond = dict()
del_cond['column'] = 'configuration_key'
del_cond['condition'] = '='
del_cond['value'] = 'OMF_TR_2'

# join these AND/ OR conditions
del_cond_2 = dict()
del_cond_2['column'] = 'type_id'
del_cond_2['condition'] = '='
del_cond_2['value'] = 1

# same as where
cond = dict()
cond['where'] = del_cond
cond['and'] = del_cond_2

payload = json.dumps(cond)
print ("DBG payload |{0}|".format(payload))

omf_created_objects = storage.delete_from_tbl("omf_created_objects", json.dumps(cond))
print ("DBG DELETE omf_created_objects|{0}|".format(omf_created_objects))








