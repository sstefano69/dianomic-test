#
# Execution : prg -f <file to evaluate>
#
import sys
import getopt

try:
    #print ("Input " + str(sys.argv[1:]) )
    opts, args = getopt.getopt( sys.argv[1:], "f:", ["file="] )

except getopt.GetoptError:
    print 'Usage: ' + sys.argv[0] + '-f <file>'
    sys.exit(2)


for opt, arg in opts:

    if opt in ( "-f", "--file" ):
        vFileName = arg
        print ("Test " + opt + " " + vFileName)


    else:
        print 'Usage: ' + sys.argv[0] + '-i <count>'
        sys.exit()


vFile = open(vFileName, 'r')

vLoop = 0

#for vLine in file.readlines():
#    vLoop += 1

while 1:
    vLines = vFile.readlines(100000)
    if not vLines:
        break
    for vLine in vLines:
        vLoop += 1

print ("Rows : {:>10,}".format(vLoop))
file.close
