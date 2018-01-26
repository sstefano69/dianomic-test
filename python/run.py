#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

import os

###  Cleanup ######################################################################################################:
#cmd = "rm -rf /home/foglamp/wrk/test_ss/test_op/python/nohup.out"
#os.system(cmd)

#cmd = "chmod 777 /home/foglamp/wrk/*; "
#os.system(cmd)

### Pytest######################################################################################################:

print("Pytest running ")

# cmd = "/home/foglamp/wrk/test_ss/test_op/bash/restore_kill.sh"


### Test ######################################################################################################:

# print("RUNNING run.py")

# cmd = "/home/foglamp/wrk/test_ss/test_op/bash/restore_kill.sh"

# cmd = "cd /home/foglamp/wrk/test_ss/python;"
# cmd += "pytest test_sample.py"

### LINT ######################################################################################################:


# cmd += "pylint /home/foglamp/wrk/test_ss/python/load.py"
# cmd += "time -p bash  /home/foglamp/wrk/test_ss/python/load.sh"

###  #########################################################################################:


print ("RUNNING |{0}|".format (cmd) )
os.system(cmd)


