import os
import psutil
import time

MAX_VALUE = 10 * 1000 * 1000

 
readings      = []
readingIdx    = 0

 
readings.append( [ 1,
                   80,
                   0,
                   None,
                   None,
                   None,
                   None,
                   None,
                   None,
                   None ] )

readings.append( [ 3,
                   "testo",
                   0,
                   None,
                   None,
                   None,
                   None,
                   None,
                   None,
                   None ] )


print " Value 1 ", readings[0][0]
print " Value 2 ", readings[1][0]
print " Value 3 ", readings[1][1]

vStart =  time.time()

for vLoop in range (1,MAX_VALUE):
    readings.append( [ 1,
                       80,
                       0,
                       None,
                       None,
                       None,
                       None,
                       None,
                       None,
                       None ] )

process = psutil.Process(os.getpid())

vEnd  = time.time()
vDiff = round (vEnd - vStart)

vMemory = process.memory_info().rss / 1000000

print ("Size   " ,MAX_VALUE)
print ("Timing " ,vDiff)
print "memory_info    : {:,}MB ".format(vMemory) 


print "virtual_memory : " ,psutil.virtual_memory()
print "swap_memory    : " ,psutil.swap_memory()

raw_input ("Step !")

del readings[:]

vMemory = process.memory_info().rss / 1000000
print "memory_info    : {:,}MB ".format(vMemory) 

raw_input ("finish !")

print ("END")
 
