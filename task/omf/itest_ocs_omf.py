#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

# Import packages
import requests
import sys

import json, random, time, platform, socket, datetime, random
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

relay_url = "https://qi-data.osisoft.com/api/omf"

producer_token = "1/ffdcb524c82c4203a72ac1ea8e9ae2f7/b8adba516775400899e628b31ec495ae/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/65227374000/L1jiLYN0UO5w89azQOh%2FiO0ypP5WW9BU9iYroU7Qcec%3D"


# ************************************************************************
def sendOMFMessageToEndPoint(message_type, OMF_data):
    try:
        msg_header = {'producertoken': producer_token, 'messagetype': message_type, 'action': 'create',
                      'messageformat': 'JSON', 'omfversion': '1.0'}

        body = json.dumps(OMF_data)

        response = requests.post(relay_url, headers=msg_header, data=body, verify=False, timeout=30)
        print(
            'Response from relay from the initial "{0}" message: \n\n Code: |{1} {2}| \n\n url: |{3}| \n\n body: |{4}| '.format(
                message_type, response.status_code,
                response.text,
                response.url,
                body))
        print("\n msg_header: |{}|".format(msg_header))


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

### main #########################################################################################:


requests.packages.urllib3.disable_warnings()

sendOMFMessageToEndPoint("Type", types)

sendOMFMessageToEndPoint("Container", containers)

sendOMFMessageToEndPoint("Data", staticData)
sendOMFMessageToEndPoint("Data", linkData)

# ************************************************************************
for x in range(1, 10):
    values = create_data_values_stream_message("measurement4")
    sendOMFMessageToEndPoint("Data", values)
