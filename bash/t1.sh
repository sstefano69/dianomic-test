#!/bin/bash

export FOGLAMP_ROOT=/home/foglamp/Development/FogLAMP


###  #########################################################################################:

test1 () {
    ${FOGLAMP_ROOT}/scripts/foglamp status
    ${FOGLAMP_ROOT}/scripts/foglamp stop
    ${FOGLAMP_ROOT}/scripts/foglamp status
}

test2 () {
    ${FOGLAMP_ROOT}/scripts/foglamp start
}


test_ssl() {

    ${FOGLAMP_ROOT}/scripts/foglamp stop
    ${FOGLAMP_ROOT}/scripts/foglamp kill
    ${FOGLAMP_ROOT}/scripts/foglamp start

    echo ">>> SET ssl -----------------------------------------------------------------"

    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
    curl -s -X PUT -H "Content-Type: application/json" -d '{"value": "false" }' http://localhost:8081/foglamp/category/rest_api/enableHttp
    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq

    ${FOGLAMP_ROOT}/scripts/foglamp status
    ${FOGLAMP_ROOT}/scripts/foglamp stop

    echo ">>> FogLAMP restarted -----------------------------------------------------------------"
    ${FOGLAMP_ROOT}/scripts/foglamp start
}

test_ssl

###  #########################################################################################:

exit 0

export REST_API_URL=https://127.0.0.1:1995;\
curl -s ${REST_API_URL}/foglamp/ping || true


ls -l ${FOGLAMP_ROOT}/data/var/run

cat ${FOGLAMP_ROOT}/data/var/run/foglamp.core.pid

rm ${FOGLAMP_ROOT}/data/var/run/foglamp.core.pid

clear screen;\
ps -elf | grep  -E "storage" | grep -v "grep";\
ps -elf | grep -E "foglamp.services" | grep -v "grep";\
ps -elf | grep -E "foglamp.tasks" | grep -v "grep"

ps -elf | grep  -E "python3" | grep -v "grep"



