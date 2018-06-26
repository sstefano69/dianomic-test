#!/bin/bash

# FogLAMP server references
export FOGLAMP_SERVER=localhost
export FOGLAMP_PORT=8081

# Configurations related to FogLAMP
export SCHEDULE_ID_OMF_PLUGIN=2b614d26-760f-11e7-b5a5-be2e44b06b34
export SENDING_PROCESS_DATA=SEND_PR_1
export SENDING_PROCESS_STAT=SEND_PR_2

# PI server references
export PI_SERVER=WIN-4M7ODKB0RH2
export PI_SERVER_PORT=5460
export PI_SERVER_UID=Administrator
export PI_SERVER_PWD=FogLamp200
export PI_SERVER_DATABASE=osidatabase
export CONNECTOR_RELAY_VERSION=2.x

# Identifies sensors and measurements types
export OMF_TYPE_ID=0010

if [[ ${CONNECTOR_RELAY_VERSION} == "1.x" ]]; then

    export OMF_PRODUCER_TOKEN=omf_north_${OMF_TYPE_ID}

elif [[ ${CONNECTOR_RELAY_VERSION} == "2.x" ]]; then

    # FIXME:
    export OMF_PRODUCER_TOKEN=
    export OMF_PRODUCER_TOKEN='uid=5ced49c3-3a55-40e7-983f-c6cdcd5c5fd1&crt=20180620084136279&sig=GaWXZ1I4Toje3Ly9Z6/wGZ+eC6bC0Njd9bFpv3Un4QI='
fi

# Define the asset information
export ASSET_CODE="fogbench_luxometer"

# Maximum numbers of retries to attempt an operation (usually corresponds to 600 seconds)
export RETRY_COUNT=600

###  #########################################################################################:

echo  "FOGLAMP_SERVER - |${FOGLAMP_SERVER}|"

#
# Main
#
url_databases=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k https://${PI_SERVER}/piwebapi/assetservers | jq --raw-output '.Items | .[] | .Links | .Databases '`
echo DBG url_Databases :${url_databases}: > /dev/tty

#
url_elements=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_databases} |  jq --raw-output '.Items | .[] | select(.Name=="'${PI_SERVER_DATABASE}'") | .Links | .Elements'`
echo DBG url_Elements :${url_elements}: > /dev/tty

#
url_elements_list=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_elements} |  jq --raw-output '.Items | .[] | .Links | .Elements'`
echo DBG url_Elements_list :${url_elements_list}: > /dev/tty

if [[ ${CONNECTOR_RELAY_VERSION} == "1.x" ]]; then

    web_id=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_elements_list} |  jq --raw-output '.Items | .[] | select(.Name=="'${OMF_PRODUCER_TOKEN}'") | .WebId '`
    echo DBG web_id :${web_id}: > /dev/tty

elif [[ ${CONNECTOR_RELAY_VERSION} == "2.x" ]]; then

    web_id=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_elements_list} |  jq --raw-output '.Items | .[] | select(.Name=="'${ASSET_CODE}'") | .WebId '`
    echo DBG web_id :${web_id}: > /dev/tty

fi
#

#
# Delete AF hierarchy
#
if [[ ${web_id} != "" ]]; then

    curl -u ${PI_SERVER_UID}:${PI_SERVER_PWD} -X DELETE -k https://${PI_SERVER}/piwebapi/elements/${web_id}
fi

#
# Delete AF ElementTemplates
#
url_element_templates=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_databases} |  jq --raw-output '.Items | .[] | select(.Name=="'${PI_SERVER_DATABASE}'") | .Links | .ElementTemplates'`
echo DBG url_ElementTemplates :${url_element_templates}: > /dev/tty

web_id=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_element_templates} |  jq --raw-output '.Items | .[] | select(.Name | contains("'${OMF_TYPE_ID}_${ASSET_CODE}'")) | .WebId '`
echo DBG web_id :${web_id}: > /dev/tty


if [[ ${web_id} != "" ]]; then

    curl -u ${PI_SERVER_UID}:${PI_SERVER_PWD} -X DELETE -k https://${PI_SERVER}/piwebapi/elementtemplates/${web_id}
fi


#
# Deletes PI server data
#
url_points=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k https://${PI_SERVER}/piwebapi/dataservers | jq --raw-output '.Items | .[] | .Links | .Points '`
echo DBG url_points :${url_points}: > /dev/tty

web_id=`curl -s -u  ${PI_SERVER_UID}:${PI_SERVER_PWD} -X GET -k ${url_points} |  jq --raw-output '.Items | .[] | select(.Name | contains("'${OMF_PRODUCER_TOKEN}'")) | .WebId '`
echo DBG web_id :${web_id}: > /dev/tty

if [[ ${web_id} != "" ]]; then

    curl -u ${PI_SERVER_UID}:${PI_SERVER_PWD} -X DELETE -k https://${PI_SERVER}/piwebapi/points/${web_id}
fi









































