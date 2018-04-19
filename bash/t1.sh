#!/bin/bash


t5 () {


second_to_wait=7
waited_minutes=$((second_to_wait/60))

echo DBG second_to_wait :${second_to_wait}:
echo DBG waited_minutes :${waited_minutes}:

second_to_wait=70
waited_minutes=$((second_to_wait/60))


echo DBG second_to_wait :${second_to_wait}:
echo DBG waited_minutes :${waited_minutes}:


}

t4 () {

    echo TEST 2

    ARCH_OS=`arch`

    if [[ "${ARCH_OS}" == "armv7l" ]]; then

        ARCH_DIR_NAME="armhf"
        ARCH_FILE_NAME="armhf"

    elif  [[ "${ARCH_OS}" == "x86_64" ]]; then

        ARCH_DIR_NAME="x86_64"
        ARCH_FILE_NAME="amd64"
    fi

    echo DBG ARCH_DIR_NAME :${ARCH_DIR_NAME}:
}

t3 () {

    name=0320_DL_data_extraction.test

    short="${name:0:4}"

    echo DBG short :${short}:

}

}t1() {
    var=`cat <<EOF
    '

      [1,2,3]
    '
EOF
    `

    tmp_file=${HOME}/p.txt

    sudo classic << EOF_1 2>> /dev/null 1>> /dev/null
    echo ${var}    | jq @csv          > ${tmp_file}
EOF_1

    echo ---  -----------------------------------------------------------------------------------------:
    cat ${tmp_file}
    echo ---  -----------------------------------------------------------------------------------------:
    # cat ${tmp_file} | sudo classic jq "."
    echo ---  -----------------------------------------------------------------------------------------:
}

t2() {

    var=`cat <<EOF
    '
    [
      {
        "average": "20",
        "min": "20",
        "timestamp": "2018-03-12 15:21:14",
        "max": "20"
      },
      {
        "average": "10",
        "min": "10",
        "timestamp": "2018-03-12 15:21:10",
        "max": "10"
      }
    ]
    '
EOF
    `

    tmp_file=${HOME}/p.txt

    sudo classic << EOF_1 2>> /dev/null 1>> /dev/null
    echo ${var}    | jq -C '[.[]|{average,min,max}|.timestamp="xxx"]'          > ${tmp_file}
EOF_1

    echo ---  -----------------------------------------------------------------------------------------:
    cat ${tmp_file}
    echo ---  -----------------------------------------------------------------------------------------:
}


#
# Main
#


t5



