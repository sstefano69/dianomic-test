#!/usr/bin/env bash

echo === Restore =========================================================================================:

source /home/foglamp/Development/FogLAMP/src/python/venv/foglamp/bin/activate

echo DBG -`pwd`-
echo DBG PID bash -$$-

# Wrapper
# cd /home/foglamp/Development/FogLAMP/src/python
# bash ./foglamp/backup_restore/restore.sh -f /tmp/foglamp_2017_09_25_15_10_22.dump

nohup python3  -m foglamp.backup_restore.restore >> /tmp/nohup.out &

pid=$!
echo DBG PID restore -$pid-

sleep 1

kill  $pid


echo === Restore end =========================================================================================:
