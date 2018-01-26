import getopt
import sys


 
try:
    print ("Input " + str(sys.argv[1:]) )
    opts, args = getopt.getopt( sys.argv[1:], "CRhi:t:", ["ifile=","table="] )

except getopt.GetoptError:
    print 'Usage: pi-loader.py -[C|R] -h -i <CSVfile> -t <tablename>'
    sys.exit(2)


for opt, arg in opts:

    if opt in ( "-i", "--ifile" ):
        print ("Test " + opt + " " + arg)

    elif opt in ( "-t", "--table" ):
        print ("Test " + opt + " " + arg)

    elif opt == "-C":
        print ("Opt C")

    elif opt == "-R":
        print ("Opt R")


    else:
        print 'Usage: pi-loader.py -[C|R] -h -i <CSVfile> -t <tablename>'
        sys.exit()


