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


# ### INSERT omf_created_objects #########################################################################################:
#
# print("Storage::insert_data :")
# data = dict()
#
# data['configuration_key'] = 'OMF_TR_1'
# data['asset_code'] = 'x'
# data['type_id'] =1
#
# omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
# print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))
#
# #
# #
# #
# print("Storage::insert_data :")
# data = dict()
#
# data['configuration_key'] = 'OMF_TR_1'
# data['asset_code'] = 'x'
# data['type_id'] = 2
#
# omf_created_objects = storage.insert_into_tbl("omf_created_objects", json.dumps(data))
# print ("DBG INSET omf_created_objects |{0}|".format(omf_created_objects))
#
# ### SELECT omf_created_objects #########################################################################################:
#
# payload = payload_builder.PayloadBuilder() \
#     .WHERE(['configuration_key', '=',  'OMF_TR_1']) \
#     .AND_WHERE(['type_id', '=', 1])\
#     .payload()
#
# print ("DBG payload |{0}|".format(payload))
#
# omf_created_objects = storage.query_tbl_with_payload('omf_created_objects', payload)
# print ("DBG SELECT omf_created_objects|{0}|".format(omf_created_objects))
#
#
# ### DELETE omf_created_objects #########################################################################################:
#
# payload = payload_builder.PayloadBuilder() \
#     .WHERE(['configuration_key', '=',  'OMF_TR_1']) \
#     .AND_WHERE(['type_id', '=', 1])\
#     .payload()
#
#
# print ("DBG payload |{0}|".format(payload))
#
# omf_created_objects = storage.delete_from_tbl("omf_created_objects", payload)
# print ("DBG DELETE omf_created_objects|{0}|".format(omf_created_objects))

### update #########################################################################################:

payload = payload_builder.PayloadBuilder() \
    .SET(last_object=92) \
    .WHERE(['id', '=', 92]) \
    .payload()

#.SET(rs='now()') \

storage.update_tbl("streams", payload)

#    .SET(rs=now()) \

# FIXME:
# values['ts'] = 'now()'

#
# condition = dict()
# condition['column'] = 'id'
# condition['condition'] = '='
# condition['value'] = 1
#
# values = dict()
# values['last_object'] = 999
# values['ts'] = 'now()'
#
# data = dict()
# data['condition'] = condition
# data['values'] = values
#
# storage.update_tbl("streams", json.dumps(data))
#







