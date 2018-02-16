#!/bin/bash

file=/home/foglamp/Development/FogLAMP/tests/system/suites/end_to_end_PI/suite.cfg

omf_type_id=`cat ${file} | grep -E '.*OMF_TYPE_ID.*=.*' | grep -o '[0-9]*'`
new_omf_type_id=$((omf_type_id+1))

echo omf_type_id :${omf_type_id}:
echo new_omf_type_id :${new_omf_type_id}:

sed -i -e s/${omf_type_id}/${new_omf_type_id}/ ${file}
