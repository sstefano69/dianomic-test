#!/bin/bash

server=WIN-4M7ODKB0RH2;\
uid=Administrator;\
pwd=FogLamp200

# Todo
# omf_translator
# lux
echo --- test Delete -----------------------------------------------------------------------------------------

# curl -s -u  ${uid}:${pwd} -X GET -k https://${server}/piwebapi/assetservers | jq

# AF
#web_id=E0YRKO_A1bWkKkHBVKS90bsABzrTEHMR6BGvuQgAJ3K4fwV0lOLTRNN09ES0IwUkgyXE9TSURBVEFCQVNFXEZPR0xBTVBcT01GX1NSVkRFVl9UUkFOU0xBVE9SXzI5MjZcRk9HQkVOQ0hfU01PS0VfVEVTVA
#
#curl -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/elements/${web_id}
#
#web_id=E0YRKO_A1bWkKkHBVKS90bsABDrTEHMR6BGvuQgAJ3K4fwV0lOLTRNN09ES0IwUkgyXE9TSURBVEFCQVNFXEZPR0xBTVBcT01GX1NSVkRFVl9UUkFOU0xBVE9SXzI5MjY
#
#curl -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/elements/${web_id}


# Pi Server
#web_id=P06MaRE0nEO0yqb1OpXYroxgVgUAAAV0lOLTRNN09ES0IwUkgyXE9NRl9TUlZERVZfVFJBTlNMQVRPUl8yOTI4Lk1FQVNVUkVNRU5UX0ZPR0JFTkNIX1NNT0tFX1RFU1Q
#
#curl -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/points/${web_id}
#
#
#exit 0

echo --- Test 2 -----------------------------------------------------------------------------------------:

url_Databases=`curl -s -u  ${uid}:${pwd} -X GET -k https://${server}/piwebapi/assetservers | jq --raw-output '.Items | .[] | .Links | .Databases '`
echo DBG url_Databases :${url_Databases}: > /dev/tty

#
#
#
url_Elements=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Databases} |  jq --raw-output '.Items | .[] | select(.Name=="osidatabase") | .Links | .Elements'`
echo DBG url_Elements :${url_Elements}: > /dev/tty


# url_ElementTemplates=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Databases} |  jq --raw-output '.Items | .[] | select(.Name=="osidatabase") | .Links | .ElementTemplates'`
# echo DBG ElementTemplates -${ElementTemplates}- > /dev/tty

#
#
#
url_Elements_list=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Elements} |  jq --raw-output '.Items | .[] | .Links | .Elements'`
echo DBG url_Elements_list :${url_Elements_list}: > /dev/tty


url_assets_list=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Elements_list} |  jq --raw-output '.Items | .[] | select(.Name=="omf_srvdev_translator_2933")  | .Links | .Elements'`
echo DBG url_assets_list :${url_assets_list}: > /dev/tty

if [[ ${url_assets_list} != "" ]];
then
    #
    # Asset
    #
    url_asset=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_assets_list} |  jq --raw-output '.Items | .[] | select(.Name=="fogbench_smoke_test") | .Links | .EndValue'`
    echo DBG url_asset :${url_asset}:  > /dev/tty

    #
    # Value
    #
    url_value=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_asset} |  jq --raw-output '.Items | .[] | select(.Name=="sensor") | .Value | .Value'`
    echo DBG url_value :${url_value}: > /dev/tty

    #
    ##
    ## web_id
    ##
    web_id=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Elements_list} |  jq --raw-output '.Items | .[] | select(.Name=="omf_srvdev_translator_2933") | .WebId '`
    echo DBG web_id -${web_id}- > /dev/tty


    # OMF.omf_srvdev_translator_2933 Connector.2933_fogbench_smoke_test_typename_sensor			Element

    #
    # Delete AF hierarchy
    #
    # curl -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/elements/${web_id}
fi

### Delete ElementTemplates #########################################################################################:

echo --- Delete ElementTemplates  -----------------------------------------------------------------------------------------:

url_ElementTemplates=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Databases} |  jq --raw-output '.Items | .[] | select(.Name=="osidatabase") | .Links | .ElementTemplates'`
echo DBG url_ElementTemplates :${url_ElementTemplates}: > /dev/tty

web_id=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_ElementTemplates} |  jq --raw-output '.Items | .[] | select(.Name | contains("fogbench/smoke_test")) | .WebId '`
#web_id=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_ElementTemplates} |  jq --raw-output '.Items | .[] | select(.Id=="8684add1-57ec-45d4-bf29-c5a47143857e") | .WebId '`
echo DBG web_id -${web_id}- > /dev/tty

if [[ ${web_id} != "" ]];
then
    #
    # Delete AF hierarchy
    #
    # curl -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/elementtemplates/${web_id}
    echo pass
fi

#
# test
#
# curl -s -u  ${uid}:${pwd} -X GET -k ${url_ElementTemplates} |  jq --raw-output



echo END 2

exit 0

###  #########################################################################################:


###  #########################################################################################:

url_Databases=`curl -s -u  ${uid}:${pwd} -X GET -k https://${server}/piwebapi/assetservers | jq --raw-output '.Items | .[] | .Links | .Databases '`
echo DBG url_Databases -${url_Databases}- > /dev/tty

#
#
#
url_Elements=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Databases} |  jq --raw-output '.Items | .[] | select(.Name=="osidatabase") | .Links | .Elements'`
echo DBG url_Elements -${url_Elements}- > /dev/tty

#
#
#
url_Elements_list=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Elements} |  jq --raw-output '.Items | .[] | .Links | .Elements'`
echo DBG url_Elements_list -${url_Elements_list}- > /dev/tty


#
# web_id
#
web_id=`curl -s -u  ${uid}:${pwd} -X GET -k ${url_Elements_list} |  jq --raw-output '.Items | .[] | select(.Name=="omf_srvdev_translator_2923") | .WebId '`
echo DBG web_id -${web_id}- > /dev/tty


#
# Delete AF hierarchy
#
echo ---  Value -----------------------------------------------------------------------------------------:
# curl -s -u ${uid}:${pwd} -X DELETE -k https://${server}/piwebapi/elements/${web_id}












































