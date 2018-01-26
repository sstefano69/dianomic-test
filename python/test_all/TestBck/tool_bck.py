'''
Created on 23 mag 2016

@author: admin
'''

# !/usr/bin/env python

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
                #print (os.path.join(root, file))
                ziph.write(os.path.join(root, file))

            except:
                print 'ERROR : <' + file + ">"
                continue


vStart = time.time()


print "START " + time.strftime("%Y-%m-%d %H:%M:%S:")

config = ConfigParser.ConfigParser()
config.readfp(open('linux.ini'))
#config.readfp(open('mobile.ini'))
# config.readfp(open('usr.ini'))

vFileName_prefix = time.strftime("%Y_%m_%d_%H_%M_%S")

dir_to_backup = []
for vLoop in range(1,100):
    try :
        vDirName = 'dir_to_backup' + str(vLoop)
        vValue = config.get('backup', vDirName )
        dir_to_backup.append(vValue)
        #dir_to_backup[vLoop]  = vValue
    except:
        print 'List ended'
        break



backup_dir       = config.get('backup', 'backup_dir')
backup_file      = config.get('backup', 'backup_file')
backup_file_full = backup_dir + "/" + vFileName_prefix + "_" + backup_file



print ("CFG " + dir_to_backup[0])
print ("CFG " + backup_file_full)

try:
    vInfo = os.stat(backup_file_full)
    # print ("File info " + str(vInfo))
    print ("File info " + str(vInfo.st_ctime))
    print ("File info " + time.ctime(vInfo.st_ctime))
    print ("File info <" + time.strftime("%Y-%m-%d %H:%M:%S:", time.localtime(vInfo.st_ctime)) + ">")
except:
    print 'ERROR stat : <' + backup_file + ">"

if (os.path.isfile(backup_file_full)):
    os.remove(backup_file_full)

# zipf = zipfile.ZipFile.setpassword('t1')

#backup_file_full="/tmp/p.zip"
zipf = zipfile.ZipFile(backup_file_full, 'w', zipfile.ZIP_DEFLATED)
# zipf = zipfile.ZipFile(backup_file, 'w', zipfile.ZIP_DEFLATED)


for vDir in dir_to_backup:
    # zipdir('u:\\', zipf)
    zipdir(vDir, zipf)

# zipf.close()

vEnd = time.time()
vElapsed = vEnd - vStart
vSeconds = round(vElapsed)

print "END " + time.strftime("%Y-%m-%d %H:%M:%S:")

print "ELAP seconds %d minutes %d" % (vSeconds, round(vSeconds / 60))


