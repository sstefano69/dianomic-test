'''
Created on 25 mag 2016

@author: admin
'''
from multiprocessing import Process
import multiprocessing
import os

vText = 90


def info(title):
    print title
    print 'module name:', __name__
    if hasattr(os, 'getppid'):  # only available on Unix
        print 'parent process:', os.getppid()
    print 'process id:', os.getpid()


def f(name):
    global vText

    vText = 80
    print ("Child - Var ", vText)
    info('function f')
    print 'hello', name


if __name__ == '__main__':
    info('main line')
    print ("Main  - Var ", vText)
    p = Process(target=f, args=('bob',))
    p.start()
    p.join()
    print ("Main  - Var ", vText)

    print ("CPU ", multiprocessing.cpu_count())

