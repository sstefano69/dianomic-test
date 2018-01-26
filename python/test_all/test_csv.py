import csv
import sys
import getopt

vFiles = "/tmp/ss/test.csv"

#################################################################################
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


#MAX_VALUE = vCount  * 1000 * 1000
MAX_VALUE = 10
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

