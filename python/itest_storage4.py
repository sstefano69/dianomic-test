#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs


import json
from collections import OrderedDict

from foglamp.core.service_registry.service_registry import Service

from foglamp.storage.storage import Storage, Readings
from foglamp.storage.exceptions import *


###  #########################################################################################:

Service.Instances.register(name="store", s_type="Storage", address="0.0.0.0", port=8080, management_port=1081)

storage = Storage()

status = storage.check_service_availibility()

print ("DBG status |{0}|".format(status))


### INSERT omf_created_objects #########################################################################################:

print("Storage::insert_data :")
data = dict()

data['configuration_key'] = 'OMF_TR_1'
data['asset_code'] = 'x'
data['type_id'] =1

omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))

#
#
#
print("Storage::insert_data :")
data = dict()

data['configuration_key'] = 'OMF_TR_1'
data['asset_code'] = 'x'
data['type_id'] = 2

omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))

### SELECT omf_created_objects #########################################################################################:

where = OrderedDict()
where['column'] = 'configuration_key'
where['condition'] = '='
where['value'] = 'OMF_TR_2'

# verify AND / OR?
where_2 = OrderedDict()
where_2['column'] = 'type_id'
where_2['condition'] = '='
where_2['value'] = 1

query_payload = OrderedDict()
query_payload['where'] = where
query_payload['and'] = where_2

payload = json.dumps(query_payload)
print ("DBG payload |{0}|".format(payload))

omf_created_objects = storage.query_tbl_with_payload('omf_created_objects', payload)
print ("DBG SELECT omf_created_objects|{0}|".format(omf_created_objects))


### DELETE omf_created_objects #########################################################################################:

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








