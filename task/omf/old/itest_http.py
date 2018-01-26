#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

# FIX
import requests

# s = requests.session()
# s.cookies.clear()

import sys


# Import packages
import json, random, time, platform, socket, datetime, random
import urllib3


urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


relay_url = "https://qi-data.osisoft.com/api/omf"

# relay_url = "https://qi-data.osisoft.com/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/omfvalidation/data"
# relay_url = "https://qi-data.osisoft.com/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/api/omf"

# BAD one
# producer_token = "ffdcb524c82c4203a72ac1ea8e9ae2f7"
producer_token = "1/ffdcb524c82c4203a72ac1ea8e9ae2f7/b8adba516775400899e628b31ec495ae/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/65227374000/L1jiLYN0UO5w89azQOh%2FiO0ypP5WW9BU9iYroU7Qcec%3D"



# ************************************************************************
def sendOMFMessageToEndPoint(message_type, OMF_data):
    try:
        msg_header = {'producertoken': producer_token, 'messagetype': message_type, 'action': 'create',
                      'messageformat': 'JSON', 'omfversion': '1.0'}

        body = json.dumps(OMF_data)

        response = requests.post(relay_url, headers=msg_header, data=body, verify=False, timeout=30)
        print('Response from relay from the initial "{0}" message: \n\n Code: |{1} {2}| \n\n url: |{3}| \n\n body: |{4}| '.format(message_type, response.status_code,
                                                                                   response.text,
                                                                                    response.url,
                                                                                        body    ))
        print ("\n msg_header: |{}|".format(msg_header))
 

    except Exception as e:
        print(str(datetime.datetime.now()) + " An error ocurred during web request: " + str(e))



# ************************************************************************
def create_data_values_stream_message(target_stream_id):
    data_values_JSON = ''
    timestamp = datetime.datetime.utcnow().isoformat() + 'Z'
    data_values_JSON = [
        {
            "containerid": target_stream_id,
            "values": [
                {
                    "Time": timestamp,
                    "reading1": 100 * random.random(),
                    "reading2": 100 * random.random()
                }
            ]
        }
    ]
    return data_values_JSON


# ************************************************************************



types = [
    {
        "id": "type_tank4",
        "type": "object",
        "classification": "static",
        "properties": {
            "Name": {
                "type": "string",
                "isindex": True
            },
            "Location": {
                "type": "string"
            }
        }
    },
    {
        "id": "type_measurement4",
        "type": "object",
        "classification": "dynamic",
        "properties": {
            "Time": {
                "format": "date-time",
                "type": "string",
                "isindex": True
            },
            "reading1": {
                "type": "number"
            },
            "reading2": {
                "type": "number"
            }
        }
    }
]

containers = [{
    "id": "measurement4",
    "typeid": "type_measurement4"
}]

staticData = [{
    "typeid": "type_tank4",
    "values": [{
        "Name": "tank1",
        "Location": "New York"
    }]
}]

linkData = [{
    "typeid": "__Link",
    "values": [{
        "source": {
            "typeid": "type_tank4",
            "index": "_ROOT"
        },
        "target": {
            "typeid": "type_tank4",
            "index": "tank1"
        }
    }, {
        "source": {
            "typeid": "type_tank4",
            "index": "tank1"
        },
        "target": {
            "containerid": "measurement4"
        }
    }]
}]

# dataValue = [{
#        "containerid": "measurement4",
#        "values": [{
#                "Time": "2017-01-11T22:23:23.430Z",
#                "reading1": "1.0",
#                "reading2": "2.0"
#        }]
# }]


requests.packages.urllib3.disable_warnings()

# sendOMFMessageToEndPoint("Type", types)
# # time.sleep(1)
#
# sendOMFMessageToEndPoint("Container", containers)
# # time.sleep(1)
# sendOMFMessageToEndPoint("Data", staticData)
# # time.sleep(1)
# sendOMFMessageToEndPoint("Data", linkData)
# # time.sleep(1)
# ************************************************************************
for x in range(1,10):
    values = create_data_values_stream_message("measurement4")
    sendOMFMessageToEndPoint("Data", values)
