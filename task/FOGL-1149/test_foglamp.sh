#!/usr/bin/env bash

#!/bin/bash

# Selects the environment
# export TEST_ENV=develop
export TEST_ENV=deploy
# export TEST_ENV=ucore

if [[ "${TEST_ENV}" == "develop" ]]; then

    export FOGLAMP_ROOT=/home/foglamp/Development/FogLAMP
    export FOGLAMP_CMD=${FOGLAMP_ROOT}/scripts/foglamp

elif [[ "${TEST_ENV}" == "deploy" ]]; then

    export FOGLAMP_ROOT=/usr/local/foglamp
    export FOGLAMP_CMD=${FOGLAMP_ROOT}/bin/foglamp

elif [[ "${TEST_ENV}" == "ucore" ]]; then

    export FOGLAMP_ROOT=/usr/local/foglamp
    export FOGLAMP_CMD=foglamp

else
    echo ERROR, test environment not set.
    exit 1
fi

clear screen
printf "\n >>> SCRIPT       :`basename ${0}` Version 1.1"

printf "\n >>> TEST_ENV     :${TEST_ENV}:  "
printf "\n >>> FOGLAMP_ROOT :${FOGLAMP_ROOT}:  "
printf "\n >>> FOGLAMP_CMD  :${FOGLAMP_CMD}:  "

###  #########################################################################################:

command_status () {

    ${FOGLAMP_CMD} status
    exit_code=$?

    if [[ $exit_code != 0 ]]; then

        echo ">>> ERROR: executing command_status :${exit_code}: "
        exit 1
    fi
}


command_stop () {

    ${FOGLAMP_CMD} stop
    exit_code=$?

    if [[ ${exit_code} != 0 ]]; then

        echo ">>> INFO: executing command_stop :${exit_code}: "
    fi
}

command_kill () {

    ${FOGLAMP_CMD} kill
    exit_code=$?

    if [[ $exit_code != 0 ]]; then

        echo ">>> ERROR: executing command_kill :${exit_code}: "
        exit 1
    fi
}

command_reset () {

    echo -e "YES" | ${FOGLAMP_CMD} reset
    exit_code=$?

    if [[ $exit_code != 0 ]]; then

        echo ">>> ERROR: executing command_reset :${exit_code}: "
        exit 1
    fi
    
    printf "\n"
}

command_start () {

    ${FOGLAMP_CMD} start
    exit_code=$?

    if [[ $exit_code != 0 ]]; then

        echo ">>> INFO: executing command_start :${exit_code}: "
    fi
}

switch_to_ssl_ucore_commands() {

        sudo classic << EOF_1 2> /dev/null
        #!/bin/bash

        curl -k -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
        curl -k -s -X PUT -d '{"value": "false" }' "http://localhost:8081/foglamp/category/rest_api/enableHttp"
        curl -k -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq

        logout
EOF_1

}

switch_to_ssl() {

    echo ">>> SET ssl -----------------------------------------------------------------"

    if [[ "${TEST_ENV}" == "ucore" ]]; then

        switch_to_ssl_ucore_commands
    else
        curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
        curl -s -X PUT -H "Content-Type: application/json" -d '{"value": "false" }' http://localhost:8081/foglamp/category/rest_api/enableHttp
        curl -s -X GET http://localhost:8081/foglamp/category/rest_api/enableHttp | jq
    fi
}

switch_to_http_ucore_commands() {


        sudo classic << EOF_11 2> /dev/null
        #!/bin/bash

        curl -k -s -X GET https://localhost:1995/foglamp/category/rest_api/enableHttp | jq
        curl -k -s -X PUT -d '{"value": "true" }' "https://localhost:1995/foglamp/category/rest_api/enableHttp"
        curl -k -s -X GET https://localhost:1995/foglamp/category/rest_api/enableHttp | jq

        logout
EOF_11


}

switch_to_http() {

    echo ">>> SET Enable HTTP  -----------------------------------------------------------------"

    if [[ "${TEST_ENV}" == "ucore" ]]; then

        switch_to_http_ucore_commands
    else
        curl -s -X GET https://localhost:1995/foglamp/category/rest_api/enableHttp | jq
        curl -s -k -X PUT -H "Content-Type: application/json" -d '{"value": "true" }' https://localhost:1995/foglamp/category/rest_api/enableHttp
        curl -s -X GET https://localhost:1995/foglamp/category/rest_api/enableHttp | jq
    fi
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

    if [[ "${TEST_ENV}" == "ucore" ]]; then

        pid_dir=/home/foglamp/snap/foglamp/common/var/run
    else
        pid_dir=${FOGLAMP_ROOT}/data/var/run
    fi

    pid_file=${pid_dir}/foglamp.core.pid

    printf "\n >>> PID file ----------------------------------------------------------------- \n"
    ls -l ${pid_dir}
    cat ${pid_file}
    printf "\n >>> PID file ----------------------------------------------------------------- \n"
}

test_step_base() {

    printf "\n--- TEST : test_step_base -----------------------------------------------------------------------------------------: \n"

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

    printf "\n--- TEST : test_reset -----------------------------------------------------------------------------------------: \n"

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

    printf "\n--- TEST : test_to_ssl -----------------------------------------------------------------------------------------: \n"

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

    printf "\n--- TEST : test_to_http -----------------------------------------------------------------------------------------: \n"

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

printf "\n--- Starts tests -----------------------------------------------------------------------------------------: \n"

test_reset

test_to_ssl
test_step_base

test_to_http
test_step_base


### Stops Foglamp #########################################################################################:

printf "\n--- Tear down -----------------------------------------------------------------------------------------: \n"

command_stop
command_kill