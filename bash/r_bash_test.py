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

cmd += "bash ./t1.sh"
# cmd += "bash ./omf_delete.sh"

# ## Run #########################################################################################:

os.system(cmd)
