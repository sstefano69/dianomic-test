import subprocess

import stdlib

#print "1"
#return_code = subprocess.call(["ls -l;sleep 2 "], shell=True)

#print "2"
#vOut = subprocess.Popen("echo Hello World;sleep 2", shell=True, stdout=subprocess.PIPE).stdout.read()
#print "3"
#print vOut

#vCmd = 'wc -l /tmp/test.txt'
#vProcess = subprocess.Popen(vCmd , shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
#vReturnVal = vProcess.wait()


vReturnVal, vOuput = stdlib.exec_wait ('wc -l /tmp/test.txt')

print "ReturnVal <%s>" % vReturnVal
print "Output    <%s>" % vOuput




