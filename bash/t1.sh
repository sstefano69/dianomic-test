#!/bin/bash

# Gets the system arch and evaluates the names to apply
ARCH_OS=`arch`
if [[ "${ARCH_OS}" == "armv7l" ]]; then

    ARCH_DIR_NAME="armhf"
    ARCH_FILE_NAME="armhf"
fi

if [[ "${ARCH_OS}" == "x86_64" ]]; then

    ARCH_DIR_NAME="x86_64"
    ARCH_FILE_NAME="amd64"
fi

# Temporary directory for the operations related to the snaps
export TMP_DIRECTORY=/home/foglamp/tmp
export SNAPS_DIRECTORY=${TMP_DIRECTORY}/snaps/${ARCH_DIR_NAME}

# Commands to be used
export CMD_WGET=" sudo classic wget "
export CMD_CURL=" sudo classic curl "
export CMD_JQ=" sudo classic jq "


# FogLAMP package references
export FOGLAMP_NAME=foglamp
export FOGLAMP_SNAP_VERSION=1.1.3
export FOGLAMP_SNAP_UPDATE_VERSION=1.1.4
export FOGLAMP_SNAP=foglamp_${FOGLAMP_SNAP_VERSION}_${ARCH_FILE_NAME}.snap
export FOGLAMP_SNAP_UPDATE=foglamp_${FOGLAMP_SNAP_UPDATE_VERSION}_${ARCH_FILE_NAME}.snap
export FOGLAMP_SNAP_PATH=https://s3.amazonaws.com/foglamp/snaps/${ARCH_DIR_NAME}/


echo DBG SNAPS_DIRECTORY :${SNAPS_DIRECTORY}: > /dev/tty
echo DBG FOGLAMP_SNAP :${FOGLAMP_SNAP}: > /dev/tty
echo DBG FOGLAMP_SNAP_UPDATE :${FOGLAMP_SNAP_UPDATE}: > /dev/tty
echo DBG FOGLAMP_SNAP_PATH :${FOGLAMP_SNAP_PATH}: > /dev/tty

# https://s3.amazonaws.com/foglamp/snaps/x86_64/foglamp_1.1.1_amd64.snap
# https://s3.amazonaws.com/foglamp/snaps/armhf/foglamp_1.1.1_armhf.snap