#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import os
import json
v = "[{'asset_code': 'fogbench/luxometer', 'readings': [{'reading': {'lux': 60158.035}, 'read_key': '776dbece-c7f2-4c9b-b6c1-e61286ad41c2', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/pressure', 'readings': [{'reading': {'pressure': 946.0}, 'read_key': '70e74656-8b57-4da9-b41d-0df327f6f056', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/humidity', 'readings': [{'reading': {'temperature': 23, 'humidity': 58}, 'read_key': 'a2efab00-d29f-4e76-b02d-6bbaf6bda4b0', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/temperature', 'readings': [{'reading': {'ambient': 4, 'object': 9}, 'read_key': 'eca29966-c46b-4a72-bed2-d3fff813587f', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/accelerometer', 'readings': [{'reading': {'x': 1, 'z': 2, 'y': 1}, 'read_key': '68106788-14c5-46a6-bfd2-ab2cc569a0e1', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/gyroscope', 'readings': [{'reading': {'x': 193, 'z': 49, 'y': 91}, 'read_key': 'd2951d12-9542-431c-b157-620331876c84', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/magnetometer', 'readings': [{'reading': {'x': 129, 'z': 114, 'y': -6}, 'read_key': 'e6fb55b9-132b-4b26-b806-b96a14d68618', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/mouse', 'readings': [{'reading': {'button': 'up'}, 'read_key': 'ce14ff50-409c-45d7-a004-802bcbfde105', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/switch', 'readings': [{'reading': {'button': 'down'}, 'read_key': '03f6c13e-5b32-4481-96d9-5a93e7c2c1cd', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}, {'asset_code': 'fogbench/wall clock', 'readings': [{'reading': {'tick': 'tock'}, 'read_key': 'f967d9b1-c41b-458e-ae75-1e357929a7d5', 'user_ts': '2018-05-30 12:22:44.837000+00'}]}]"

v = v.replace("'","\"")

step1 = json.loads(v)
step2 = json.dumps(step1, sort_keys=True, indent=4)


print("Test |{0}| ".format(v))

print("Test |{0}| ".format(step2))