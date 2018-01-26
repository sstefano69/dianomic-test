 #
# Output String
#

import time

gStart =  list(xrange(1000))
gEnd =  list(xrange(1000))

########################################################################################################################
#
# Timing
#
def timing_start(vIdx=1):
    global gStart

    gStart[vIdx] = time.time()

def timing_end(vIdx=1):
    global gStart
    global gEnd

    gEnd [vIdx]= time.time()
    vDiff = round(gEnd [vIdx]- gStart [vIdx])
    return (vDiff)


def timing_read(vIdx=0):
    global gStart
    global gEnd


    vDiff = round(gEnd [vIdx]- gStart [vIdx])
    return (vDiff)

########################################################################################################################
#
# Messaging
#
def write_out( outString,
               printTime = False,
               newLine   = True ):

    if printTime:
        if newLine:
            print time.strftime( "%Y-%m-%d %H:%M:%S:" ), outString
        else:
            print time.strftime( "%Y-%m-%d %H:%M:%S:" ), outString,
    else:
        if newLine:
            print outString
        else:
            print outString,
    # END if

    return

if __name__ == '__main__':
    write_out("Test")
    
    