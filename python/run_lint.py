#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

import os

###  Cleanup ######################################################################################################:
#cmd = "rm -rf /home/foglamp/wrk/test_ss/test_op/python/nohup.out"
#os.system(cmd)

#cmd = "chmod 777 /home/foglamp/wrk/*; "
#os.system(cmd)

### Lint version #########################################################################################:
# pylint 1.7.1

#
# cd /home/foglamp/Development/FogLAMP/src/python/foglamp/device;\
# pylint poll_device.py  > poll_device.log;
#

cmd = """
bash -c '
cd ~/Development/FogLAMP/src/python;\
source venv/foglamp/bin/activate;\
pylint_prg=/home/foglamp/Development/FogLAMP/src/python/venv/foglamp/bin/pylint;\
${pylint_prg} --version;\
cd /home/foglamp/Development/FogLAMP/src/python/foglamp;\
${pylint_prg} sending_process.py  > sending_process.log
'
"""




###  #########################################################################################:


print ("RUNNING |{0}|".format (cmd) )
os.system(cmd)


