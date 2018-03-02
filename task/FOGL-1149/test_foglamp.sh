#!/usr/bin/env bash

#!/bin/bash

export TEST_ENV=develop


if [[ "${TEST_ENV}" == "develop" ]]; then

    export FOGLAMP_ROOT=/home/foglamp/Development/FogLAMP
    export FOGLAMP_CMD=${FOGLAMP_ROOT}/scripts/foglamp

elif [[ "${TEST_ENV}" == "deploy" ]]; then

    export FOGLAMP_ROOT=/usr/local/foglamp
    export FOGLAMP_CMD=${FOGLAMP_ROOT}/bin/foglamp

elif [[ "${TEST_ENV}" == "snap" ]]; then

    export FOGLAMP_ROOT=/usr/local/foglamp
    export FOGLAMP_CMD=foglamp

else
    echo ERROR, test environment not set.
    exit 1
fi

printf "\n >>> TEST_ENV     :${TEST_ENV}:  "
printf "\n >>> FOGLAMP_ROOT :${FOGLAMP_ROOT}:  "
printf "\n >>> FOGLAMP_CMD  :${FOGLAMP_CMD}:  "

###  #########################################################################################:

command_status () {
    ${FOGLAMP_CMD} status
}


command_stop () {
    ${FOGLAMP_CMD} stop
}

command_kill () {
    ${FOGLAMP_CMD} kill
}

command_reset () {
    echo -e "YES" | ${FOGLAMP_CMD} reset
}

command_start () {
    ${FOGLAMP_CMD} start
}


switch_to_ssl() {

    echo ">>> SET ssl -----------------------------------------------------------------"

    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
    curl -s -X PUT -H "Content-Type: application/json" -d '{"value": "false" }' http://localhost:8081/foglamp/category/rest_api/enableHttp
    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
}

switch_to_http() {

    echo ">>> SET Enable HTTP  -----------------------------------------------------------------"

    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
    curl -s -k -X PUT -H "Content-Type: application/json" -d '{"value": "true" }' https://localhost:1995/foglamp/category/rest_api/enableHttp
    curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
}

function_ping_ssl() {

    export REST_API_URL=https://127.0.0.1:1995

    curl -s ${REST_API_URL}/foglamp/ping || true
}

function_ping_http() {

    export REST_API_URL=http://127.0.0.1:8081

    curl -s ${REST_API_URL}/foglamp/ping || true
}

function_process_list() {

    ps -elf | grep  -E "storage|foglamp.services|foglamp.tasks|bin/postgres|storage" | grep -v "grep"
}

function_get_pid_file() {

    printf "\n >>> PID file ----------------------------------------------------------------- \n"
    ls -l ${FOGLAMP_ROOT}/data/var/run
    cat ${FOGLAMP_ROOT}/data/var/run/foglamp.core.pid
    printf "\n >>> PID file ----------------------------------------------------------------- \n"
}

test_step_base() {

    printf "\n --- test_step_base -----------------------------------------------------------------------------------------: "

    echo --- Stop -----------------------------------------------------------------------------------------:
    command_stop
    command_kill
    function_process_list

    echo --- Start -----------------------------------------------------------------------------------------:
    command_start
    command_status

    echo --- Stop -----------------------------------------------------------------------------------------:
    command_stop
    function_process_list
}


test_reset() {

    printf "\n --- test_reset -----------------------------------------------------------------------------------------: "

    echo --- Stop -----------------------------------------------------------------------------------------:
    command_stop
    function_process_list

    echo --- Reset -----------------------------------------------------------------------------------------:
    command_reset

    echo --- Start-----------------------------------------------------------------------------------------:
    command_start
    command_status
}

test_to_ssl() {

    printf "\n --- test_to_ssl -----------------------------------------------------------------------------------------: "

    echo --- Stop -----------------------------------------------------------------------------------------:
    command_stop
    command_kill

    function_process_list

    echo --- Start-----------------------------------------------------------------------------------------:
    command_start
    function_get_pid_file

    echo --- To SSL -----------------------------------------------------------------------------------------:

    switch_to_ssl
    command_stop
    command_start

    echo --- Status -----------------------------------------------------------------------------------------:

    function_get_pid_file
    command_status

}

test_to_http() {

    printf "\n --- test_to_http -----------------------------------------------------------------------------------------: "

    echo --- Stop -----------------------------------------------------------------------------------------:
    command_stop
    command_kill

    function_process_list

    echo --- Start-----------------------------------------------------------------------------------------:
    command_start
    function_get_pid_file

    echo --- To HTTP -----------------------------------------------------------------------------------------:

    switch_to_http
    command_stop
    command_start

    echo --- Status -----------------------------------------------------------------------------------------:

    function_get_pid_file
    command_status

}

### Tests #########################################################################################:

printf "\n --- Starts tests -----------------------------------------------------------------------------------------: \n"

test_reset

test_to_ssl
test_to_http

test_step_base


### Stops Foglamp #########################################################################################:

printf "\n --- Tear down -----------------------------------------------------------------------------------------: "

command_stop
command_kill