'''
Created on 25 mag 2016

@author: admin
'''

import sys

if __name__ == '__main__':
    for ss,node in enumerate (sys.path):
        print ("sys : ", ss+1, " ", node )
    