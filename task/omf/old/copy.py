#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

# Import packages
import sys, json, random, time, platform, requests, socket, datetime, random
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

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


# relay_url = "https://WIN-4M7ODKB0RH2:5460/ingress/messages"

# relay_url = "https://qi-data.osisoft.com/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/api/omf"
relay_url = "https://qi-data.osisoft.com/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/omfvalidation/data"
# relay_url = "https://qi-data.osisoft.com/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/api/omf"

# producer_token = "ffdcb524c82c4203a72ac1ea8e9ae2f7"
producer_token = "1/ffdcb524c82c4203a72ac1ea8e9ae2f7/b8adba516775400899e628b31ec495ae/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/65227374000/L1jiLYN0UO5w89azQOh%2FiO0ypP5WW9BU9iYroU7Qcec%3D"



###  #########################################################################################:

import requests

authorization = requests.post('https://login.windows.net/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/oauth2/token',
        data = { 'grant_type' : 'client_credentials',
        'client_id' : '34571f14-d7d5-4cee-aaf6-0a5395bb6a10',
        'client_secret' : 'Ia9xCiRNuCiiCv793M7EU24KNT5re+Gfwg2ABwoPfAY=',
        'resource' : 'https://qihomeprod.onmicrosoft.com/ocsapi'
        })

headers = {'Authorization' : 'bearer %s' % authorization.json()['access_token'],
           'Content-type':'application/json',
           'Accept': 'text/plain'}

# Stream retrieval call
api = "/api/Tenants/4be9ded8-c6a6-44ac-8e1a-9db44e58fa49/Publishers"
response = requests.get('https://qi-data.osisoft.com' + api , headers = headers);

print('--- Publishers ---------------------------------------------------------------------------')

print('Response message: \n Code: |{0}| \n|{1}| \n url: |{2}|   '.format(
    response.status_code,
    response.text,
    response.url,
))

values = create_data_values_stream_message("measurement1")

body = json.dumps(values)
response = requests.post(relay_url, headers=headers, data=body, verify=False, timeout=30)

print('--- omfvalidation/data ---------------------------------------------------------------------------')
print('Response message: \n Code: |{0}| \n|{1}| \n url: |{2}| \n body: |{3}| '.format(
    response.status_code,
    response.text,
    response.url,
    body))

sys.exit(0)
###  #########################################################################################:

# ************************************************************************
def sendOMFMessageToEndPoint(message_type, OMF_data):
    try:
        msg_header = {'producertoken': producer_token, 'messagetype': message_type, 'action': 'create',
                      'messageformat': 'JSON', 'omfversion': '1.0'}

        body = json.dumps(OMF_data)
        response = requests.post(relay_url, headers=msg_header, data=body, verify=False, timeout=30)
        print('Response from relay from the initial "{0}" message: \n Code: |{1} {2}| \n url: |{3}| \n body: |{4}| '.format(message_type, response.status_code,
                                                                                   response.text,
                                                                                    response.url,
                                                                                        body    ))
        print ("msg_header: |{}|".format(msg_header))
        print("step 3")

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
        "id": "type_tank",
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
        "id": "type_measurement",
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
    "id": "measurement1",
    "typeid": "type_measurement"
}]

staticData = [{
    "typeid": "type_tank",
    "values": [{
        "Name": "tank1",
        "Location": "New York"
    }]
}]

linkData = [{
    "typeid": "__Link",
    "values": [{
        "source": {
            "typeid": "type_tank",
            "index": "_ROOT"
        },
        "target": {
            "typeid": "type_tank",
            "index": "tank1"
        }
    }, {
        "source": {
            "typeid": "type_tank",
            "index": "tank1"
        },
        "target": {
            "containerid": "measurement1"
        }
    }]
}]

# dataValue = [{
#        "containerid": "measurement1",
#        "values": [{
#                "Time": "2017-01-11T22:23:23.430Z",
#                "reading1": "1.0",
#                "reading2": "2.0"
#        }]
# }]


requests.packages.urllib3.disable_warnings()

values = create_data_values_stream_message("measurement1")
sendOMFMessageToEndPoint("Data", values)

sys.exit(0)

sendOMFMessageToEndPoint("Type", types)
# time.sleep(1)
sendOMFMessageToEndPoint("Container", containers)
# time.sleep(1)
sendOMFMessageToEndPoint("Data", staticData)
# time.sleep(1)
sendOMFMessageToEndPoint("Data", linkData)
# time.sleep(1)
# ************************************************************************
for x in range(1,5):
    values = create_data_values_stream_message("measurement1")
    sendOMFMessageToEndPoint("Data", values)
    time.sleep(1)
