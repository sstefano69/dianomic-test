#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

import sys
import inspect

def itest_function2():
    print("fun  {0} ".format(inspect.currentframe().f_code.co_name))
    print("call {0} ".format(inspect.currentframe().f_back.f_code.co_name))

def itest_function():
    print("fun  {0} ".format(inspect.currentframe().f_code.co_name))
    print("call {0} ".format(inspect.currentframe().f_back.f_code.co_name))
    itest_function2()

# noinspection PyProtectedMember
print("fun  {0} ".format(inspect.currentframe().f_code.co_name))

itest_function()