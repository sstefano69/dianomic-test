#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import os

# ### Cfg #########################################################################################:

script_path = "/home/foglamp/Development/FogLAMP/tests/system/suites"

script_bash = "/home/foglamp/Development/FogLAMP/tests/system/tests/bash"

# test_suite = "end_to_end_OCS"
test_suite = "end_to_end_PI"
# test_suite = "SOW"

# ## Clean up #########################################################################################:

# cmd = "rm -rf /usr/local/scaledb/tmp/scaledb-test-performance.log"
# os.system(cmd)


# ## Setup#########################################################################################:

# path = script_path + '/{0}/t'.format(test_suite)
# cmd = "chmod 755 {}/*.test".format(path)
# os.system(cmd)
#
# path = script_path + '/foglamp-test'
# cmd = "chmod 755 {}".format(path)
# os.system(cmd)
#
# path = script_bash + '/*.bash'
# cmd = "chmod 755 {}".format(path)
# os.system(cmd)


# ## Fixes #########################################################################################:

#cmd = "cd {};".format(script_path)

cmd = ""

# Fix
#cmd += "pkill storage;"
cmd += "sudo sh -c '> /var/log/syslog';"

# Increments OMF_TYPE_ID
# cmd += """
# bash -c '
# file=/home/foglamp/Development/FogLAMP/tests/system/suites/end_to_end_PI/suite.cfg;
#
# omf_type_id=`cat ${file} | grep -E '.*OMF_TYPE_ID.*=.*' | grep -o '[0-9]*'`;
# new_omf_type_id=$((omf_type_id+1));
#
# sed -i -e s/${omf_type_id}/${new_omf_type_id}/ ${file};
# ';
# """

os.system(cmd)

# ## Prepare C #########################################################################################:

C_path = "/home/foglamp/Development/FogLAMP/tests/unit/C/plugins/common/build"

# C_file = "/home/foglamp/Development/FogLAMP/C/tasks/north/sending_process/sending_process.cpp"

cmd = "cd {path};".format(path=C_path)

cmd += """
cmake ..;\
make;\
./RunTests
"""

# ## Prepare Suite test #########################################################################################:

#cmd = "cd {};".format(script_path)

# cmd += "bash ./foglamp-test {0} --list".format(test_suite)
# cmd += "bash ./foglamp-test {0}".format(test_suite)

#cmd += "bash  ./foglamp-test {0}  ".format(test_suite)

# ### Exec  ######################################################################################################:

os.system(cmd)





















