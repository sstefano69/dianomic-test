'''
Created on 18 mag 2016

@author: admin
'''
'''
Created on May 19, 2016

@author: scaledb
'''
import subprocess


vCmd = (
        "notepad",
        "notepad"
        )

for vItem in vCmd:   
    #print vItem
    #subprocess.call([vItem ,""])    
    proc = subprocess.Popen([vItem], shell=False,stdin=None, stdout=None, stderr=None, close_fds=True)
    
 