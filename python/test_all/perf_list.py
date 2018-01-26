# Should be installed : psutil
# perf_list.py -c 1

import os
import psutil
import time
import getopt
import sys


#
# Read User input : number of milions
#
try:
    # print ("Input " + str(sys.argv[1:]) )
    opts, args = getopt.getopt(sys.argv[1:], "c:", ["count="])

except getopt.GetoptError:
    print 'Usage: ' + sys.argv[0] + '-c <count>'
    sys.exit(2)

for opt, arg in opts:

    if opt in ("-c", "--count"):
        # print ("Test " + opt + " " + arg)
        vCount = int(arg)

    else:
        print 'Usage: ' + sys.argv[0] + '-i <count>'
        sys.exit()

print "Version 1.0"

MAX_VALUE = vCount * 1000 * 1000
vStart = time.time()

#############################################################################
# Test execution
#
readings = []

for vLoop in range(1, MAX_VALUE):
    readings.append([1,
                     80,
                     0,
                     None,
                     None,
                     None,
                     None,
                     None,
                     None,
                     None])

#############################################################################

process = psutil.Process(os.getpid())

vEnd = time.time()
vDiff = round(vEnd - vStart)


vMemoryProcess = process.memory_info().rss / 1000000
vMemoryVM = psutil.virtual_memory()
vMemorySwap = psutil.swap_memory()

print "Interactions       : {:>10,}    ".format(MAX_VALUE).rjust(10)
print "Timing             : {:>10}sec  ".format(vDiff).rjust(10)
print "Process size       : {:>10,}MB  ".format(vMemoryProcess)

print "Physical total     : {:>10,}MB  ".format(vMemoryVM.total / 1000000)
print "Physical available : {:>10,}MB  ".format(vMemoryVM.available / 1000000)
print "SWAP               : {:>10}%    ".format(vMemorySwap.percent)

#############################################################################

del readings

#############################################################################


vMemoryProcess2 = process.memory_info().rss / 1000000
print "Process size       : {:>10,}MB  ".format(vMemoryProcess2)

raw_input("press a key to finish !")
print ("END")
