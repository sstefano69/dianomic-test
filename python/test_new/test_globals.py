

dockerCmd = "test 1"

def prova ():
    global dockerCmd

    print " prova " + dockerCmd
    dockerCmd = "test 2"
    print " prova " + dockerCmd



prova ()