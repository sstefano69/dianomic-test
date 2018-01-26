# Should be installed : psutil


import os
import psutil
import time
import getopt
import sys

class cstruct:
    var_i = 0
    var_f = 0.0
    var_l = 0
    #var_str = ""
    #values = ""   # list cannot be initialized here!




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

print "PERF CSV - Version 1.0"

MAX_VALUE = vCount * 1000 * 1000
vStart = time.time()

#############################################################################
# Test execution
#

import csv
import sys
import getopt

vFiles = "/tmp/ss/test.csv"

#################################################################################

vDataList = []

for vLoop in range(1, MAX_VALUE):
    vDataList.append([
                 str(vLoop),
                 'test2',
                 81,
                 'test3'
                 ])

#
# Write file
#
with open( vFiles, 'w+' ) as csvFile:
    vWriter = csv.writer (csvFile,dialect='excel',  delimiter = ',', quotechar = '"' , quoting = csv.QUOTE_NONNUMERIC)
    for vLoop in range(1,3):
        vWriter.writerow(['row1' , 'test2',90 ,'test3'])

    #vWriter.writerow(vDataList)

    # Write Data to File
    for vRow in vDataList:
        vWriter.writerow(vRow)

#
# Read file
#
vCount = 0
vDataRead = []
with open( vFiles, 'rb' ) as csvFile:
    csvReader = csv.reader( csvFile )
    for csvLine in csvReader:
        vDataRead.append(csvLine)
        vCount += 1

print "Vale  {:>10} ".format(vDataRead[0][0])
print "Vale  {:>10} ".format(vDataRead[0][1])
print "Vale  {:>10} ".format(vDataRead[4][0])

print "Total rows  {:>10} ".format(vCount)


#############################################################################

process = psutil.Process(os.getpid())

vEnd = time.time()
vDiff = round(vEnd - vStart)


vMemoryProcess = process.memory_info().rss / 1000000
vMemoryVM = psutil.virtual_memory()
vMemorySwap = psutil.swap_memory()

print "Interactions       : {:>10,}    ".format(MAX_VALUE).rjust(10)
print "Timing             : {:>10}sec  ".format(vDiff).rjust(10)
print "Process size   1   : {:>10,}MB  ".format(vMemoryProcess)

print "Physical total     : {:>10,}MB  ".format(vMemoryVM.total / 1000000)
print "Physical available : {:>10,}MB  ".format(vMemoryVM.available / 1000000)
print "SWAP               : {:>10}%    ".format(vMemorySwap.percent)

#############################################################################

del vDataList
del vDataRead

#############################################################################


vMemoryProcess2 = process.memory_info().rss / 1000000
print "Process size   2   : {:>10,}MB  ".format(vMemoryProcess2)

#raw_input("press a key to finish !")
print ("END")
