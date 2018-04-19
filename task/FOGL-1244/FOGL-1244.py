import json
from foglamp.common.jqfilter import JQFilter

data = [{'read_key': '0e136113-6f2b-438f-8322-21244a5a2b7b',
         'user_ts': '2018-04-11 10:40:08.030813+00',
         'asset_code': 'fogbench/luxometer',
         'id': 1, 'reading': {'lux': 125903.32}},
        {'read_key': 'b2af8a10-e627-482c-916b-bbd43c860a8b',
         'user_ts': '2018-04-11 10:40:08.030945+00',
         'asset_code': 'fogbench/pressure',
         'id': 2, 'reading': {'pressure': 990.3}}]

jqfilter = JQFilter()
print("RAW DATA::{}".format(data))
Rule1 = "(.[]|.reading|.addedField)=512"
Rule2 = '[.[]|{id,asset_code,reading,user_ts,read_key}|.reading.addedField=512]'

print ("")
print("Rule1::{}".format(Rule1))
print ("")
data_to_send = jqfilter.transform(data, Rule1)


data_new=json.dumps(data_to_send)
print("Transformed Data::{}".format(data_new))

print ("2")
data_new=json.dumps(data_to_send)
print("Transformed Data::{}".format(data_new))

print ("3")
data_new3=eval(json.dumps(data_to_send))
print("Transformed Data::{}".format(data_new3))

print ("4")
data_new4=data_new3[0]
print("Transformed Data 4::{}".format(data_new4))

print ("")

print("Transformed Data::{}".format(data_to_send))
