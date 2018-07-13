import json
from foglamp.common.jqfilter import JQFilter

data = [{'read_key': '0e136113-6f2b-438f-8322-21244a5a2b7b',
         'user_ts': '2018-04-11 10:40:08.030813+00',
         'asset_code': 'sinusoid',
         'id': 1, 'reading': {'sinusoid': 125903.32}},
        {'read_key': 'b2af8a10-e627-482c-916b-bbd43c860a8b',
         'user_ts': '2018-04-11 10:40:08.030945+00',
         'asset_code': 'sinusoid',
         'id': 2, 'reading': {'sinusoid': -1.3}}]

jqfilter = JQFilter()
print("RAW DATA::{}".format(data))

#Multiply key value
Rule1 = '.[] | .reading.sinusoid = (2 * .reading.sinusoid)?'

#add new key
Rule2 = '.[] | .reading.sinusoid2 = (2 * .reading.sinusoid)?'

#rename key
Rule3 = '.[] | .reading.sinusoid2 = .reading.sinusoid | del(.reading.sinusoid)'

# Delete all where value <= 0
Rule4 = '.[] |if .reading.sinusoid > 0 then . else empty end'


print("Rule1::{}".format(Rule1))
data_to_send = jqfilter.transform(data, Rule1)
print("Transformed Data::{}".format(json.dumps(data_to_send)))

print("Rule2::{}".format(Rule2))
data_to_send = jqfilter.transform(data, Rule2)
print("Transformed Data::{}".format(json.dumps(data_to_send)))

print("Rule3::{}".format(Rule3))
data_to_send = jqfilter.transform(data, Rule3)
print("Transformed Data::{}".format(json.dumps(data_to_send)))

print("Rule4::{}".format(Rule4))
data_to_send = jqfilter.transform(data, Rule4)
print("Transformed Data::{}".format(json.dumps(data_to_send)))