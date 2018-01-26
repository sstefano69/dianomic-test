#
# Execution : prg -c <number of millions of rows>
#

import os
import psutil
import time
import getopt
import sys
import pymysql
import datetime

import stdlib
import configuration

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


MAX_VALUE = vCount  * 1000 * 1000
readings = []

stdlib.timing_start(1)

#
# Test execution - Db Test - mySQL
#
destTable= "test1"
myConnection = pymysql.connect(configuration.host,
                               configuration.user,
                               configuration.passwd,
                               configuration.db)

myCursor = myConnection.cursor()

dropTable = "DROP TABLE IF EXISTS test." + destTable
createTable = ('CREATE TABLE test.' + destTable + '('
                                                 ' reading_timestamp timestamp NOT NULL,'
                                                 ' meter_name char(25) NOT NULL,'
                                                 ' reading_event BIGINT  NOT NULL,'
                                                 ' meter_state decimal(14,7) DEFAULT NULL,'
                                                 ' hly_deliv_kwh_rup decimal(25,20) DEFAULT NULL,'
                                                 ' hly_deliv_kwh decimal(25,20) DEFAULT NULL,'
                                                 ' avg_volt0 decimal(14,7) DEFAULT NULL,'
                                                 ' deliv_kwh0 decimal(25,20) DEFAULT NULL,'
                                                 ' fluct_idx decimal(25,20) DEFAULT NULL,'
                                                 ' rec_kwh0 decimal(25,20) DEFAULT NULL,'
                                                 ' PRIMARY KEY (reading_timestamp,meter_name,reading_event) )'
                                                 ' ENGINE=InnoDB')

print ("[re]Creating table" + destTable + "... ")
myCursor.execute(dropTable)
myCursor.execute(createTable)
print("Done.")

curMeter =1
maxTimestamp  = datetime.datetime( 2015, 12, 26, 0, 0, 0)

for vLoop in range(1, MAX_VALUE):
    readings.append([curMeter,
                 maxTimestamp,
                 vLoop,
                 None,
                 None,
                 None,
                 None,
                 None,
                 None,
                 None])

stdlib.timing_end(1)


stdlib.timing_start(2)

insertString = 'INSERT INTO test.' + destTable + ' (meter_name,reading_timestamp,reading_event,meter_state,hly_deliv_kwh_rup,hly_deliv_kwh,avg_volt0,deliv_kwh0,fluct_idx,rec_kwh0) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'


myCursor.executemany( insertString, readings )
myConnection.commit()

stdlib.timing_end(2)

myCursor.close()
myConnection.close()
#####


process = psutil.Process(os.getpid())



vMemoryProcess = process.memory_info().rss / 1000000
vMemoryVM = psutil.virtual_memory()
vMemorySwap = psutil.swap_memory()

print "Interactions   : {:>10,}    ".format(MAX_VALUE).rjust(10)
print "Timing  List   : {:>10}sec  ".format(stdlib.timing_read(1)).rjust(10)
print "Timing  DB     : {:>10}sec  ".format(stdlib.timing_read(2)).rjust(10)
print "Process size   : {:>10,}MB  ".format(vMemoryProcess)

print "Physical mem   : {:>10,}MB  ".format(vMemoryVM.total / 1000000)
print "SWAP           : {:>10}%    ".format(vMemorySwap.percent)

del readings

vMemoryProcess2 = process.memory_info().rss / 1000000
print "Process size   : {:>10,}MB  ".format(vMemoryProcess2)

raw_input("press a key to finish !")
print ("\n END")


