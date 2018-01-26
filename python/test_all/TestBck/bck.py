'''
Created on 23 mag 2016

@author: admin
'''

#!/usr/bin/env python

import ConfigParser
import datetime
import time
import sys
import os
import zipfile

def zipdir(path, ziph):
    # ziph is zipfile handle
    for root, dirs, files in os.walk(path):
        for file in files:
            try:
                ziph.write(os.path.join(root, file))

            except:
                print 'ERROR : <' + file + ">"
                continue

vStart =  time.time()
        
print "START " + time.strftime( "%Y-%m-%d %H:%M:%S:" ) 

config = ConfigParser.ConfigParser()
config.readfp(open('mobile.ini'))
#config.readfp(open('usr.ini'))

dir_to_backup = config.get ('backup','dir_to_backup')
backup_file  = config.get ('backup','backup_file')

print ("CFG " + dir_to_backup)
print ("CFG " + backup_file )

try: 
    vInfo = os.stat (backup_file)
    #print ("File info " + str(vInfo))
    print ("File info " + str(vInfo.st_ctime) )
    print ("File info " + time.ctime(vInfo.st_ctime) )
    print ("File info <" + time.strftime( "%Y-%m-%d %H:%M:%S:",time.localtime(vInfo.st_ctime) )  + ">")
except:
    print 'ERROR stat : <' + backup_file + ">"

    
if (os.path.isfile(backup_file) ):
    os.remove(backup_file) 

 
#zipf = zipfile.ZipFile.setpassword('t1')

zipf = zipfile.ZipFile(backup_file, 'w', zipfile.ZIP_DEFLATED)
#zipf = zipfile.ZipFile(backup_file, 'w', zipfile.ZIP_DEFLATED) 

 
#zipdir('u:\\', zipf)
zipdir(dir_to_backup, zipf)

#zipf.close()

vEnd =  time.time()
vElapsed = vEnd - vStart
vSeconds = round(vElapsed)

print "END " + time.strftime("%Y-%m-%d %H:%M:%S:" )

 

print "ELAP seconds %d minutes %d" % (vSeconds, round(vSeconds/60))
 

