#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

import os

# ### Cfg #########################################################################################:

script_path = "/home/foglamp/wrk/bash"

# ## Setup#########################################################################################:

path = script_path
cmd = "chmod 755 {}/*.sh".format(path)
os.system(cmd)

# ## Prepare #########################################################################################:


cmd = "cd {};".format(script_path)

# cmd += "bash /home/foglamp/wrk/task/FOGL-1149/test_foglamp.sh"

#cmd += "bash /home/foglamp/wrk/bash/t1.sh"


#cmd += "bash /home/foglamp/Development/FogLAMP/tests/system/tests/bash/pi_delete.bash"
cmd += "bash /home/foglamp/wrk/task/FOGL-999/pi_delete.sh"

# cmd += "/home/foglamp/Development/FogLAMP/scripts/foglamp"

# ## Run #########################################################################################:

os.system(cmd)
