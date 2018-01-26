#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018 ihs

def parametrized(deccorator):
    def wrapper_1(*args, **kwargs):

        def wrapper_2(function):
            return deccorator(function, *args, **kwargs)

        return wrapper_2

    return wrapper_1

@parametrized
def _performance_log(func, param):
    """ Logs information for performance measurement """

    def wrapper(*arg):
        """ wrapper """

        print("Warpper {}".format(param))
        # Code execution
        res = func(*arg)

        return res

    return wrapper


@_performance_log("test 1")
def function_1():
    print ("function ")

@_performance_log("test 2")
def function_2():
    print ("function ")


print ("main ")
function_1 ()
function_2 ()