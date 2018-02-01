#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import os

script_path = "/home/foglamp/wrk/bash"

# ###  Setup / Cleanup ##############################################################################################:

cmd = "chmod 755 {}/*.sh".format(script_path)
os.system(cmd)

# cmd = "rm -rf /usr/local/scaledb/tmp/scaledb-test-performance.log"
# os.system(cmd)

# ### Prepare ######################################################################################################:

cmd = "cd {};".format(script_path)

# ###  Test ######################################################################################################:

cmd += "bash -x ./t1.sh"

# ### Exec  ######################################################################################################:

os.system(cmd)



