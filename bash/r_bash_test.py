#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import os
import sys

### Python code #########################################################################################:

print("### Python code ###################################################################")


value = 0

try:
    v = ["1", "2"]
    value = int(v[3])
except IndexError:
    value = 0


sys.exit(0)

# ### Cfg #########################################################################################:

script_path = "/home/foglamp/wrk/bash"

# ## Setup#########################################################################################:

path = script_path
cmd = "chmod 755 {}/*.sh".format(path)
os.system(cmd)




# ## Prepare #########################################################################################:


cmd = "cd {};".format(script_path)

# cmd += "bash /home/foglamp/wrk/task/FOGL-1149/test_foglamp.sh"

#cmd += "bash /home/foglamp/wrk/bash/t1.sh 'p 1' p2 p3"

print ("### Test 4.1  ###################################################################")

cmd += "bash -x  /home/foglamp/Development/FogLAMP/scripts/foglamp status"

#cmd += "bash /home/foglamp/Development/FogLAMP/tests/system/tests/bash/pi_delete.bash"
#cmd += "bash /home/foglamp/wrk/task/tools/pi/pi_delete.sh"

# cmd += "/home/foglamp/Development/FogLAMP/scripts/foglamp"

# ## Run #########################################################################################:

os.system(cmd)
###  #########################################################################################:

