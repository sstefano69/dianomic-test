import socket
import sys

import subprocess
import time

from Crypto.Cipher import AES


########################################################################################################################
# Functions

def msg_handling (data):
    global connection

    print  'received "%s"' % data

    # !F!

    vReturnVal, vOuput = exec_wait(data, False)
    f2_write(data + " - " + str(vReturnVal))
    if (vReturnVal == 0):
        f1_write(data + " - " + vOuput)
    else:
        f1_write(data + " - ")

    print   'sending data back to the client'
    connection.sendall(str(vReturnVal))



def f1_write(vText):
    vTextStr=''

    if (type(vText) is not str):
        vTextStr = str(vText)
    else:
        vTextStr = vText

    file = open("/tmp/ss/test_1.txt", 'a');
    file.write("test <%s> \n" % vTextStr);
    file.write("=======================================================\n");
    file.close


def f2_write(vText ):
    vTextStr = ''

    if (type(vText) is not str):
        vTextStr = str(vText)
    else:
        vTextStr = vText

    file = open("/tmp/ss/test_2.txt", 'a');
    file.write("test <%s> \n" % str(vTextStr));
    file.write("=======================================================\n");
    file.close




def exec_wait(vCmd, vRemoveCR=True):
    vProcess = subprocess.Popen(vCmd , shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    vReturnVal = vProcess.wait()

    if (vRemoveCR == True):
        vOutput =  vProcess.stdout.read().replace("\n", "")
    else:
        vOutput = vProcess.stdout.read()

    return (vReturnVal, vOutput)


########################################################################################################################
# Main

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Bind the socket to the port
#server_address = (socket.gethostname(), 10000)
remote_ip = socket.gethostbyname( socket.gethostname() )
#server_address = ('192.168.1.105', 10000)
server_address = (remote_ip, 10000)

print "Server    <%s>" % socket.gethostname()
print "Server IP <%s>" % remote_ip

HOST = ''   # Symbolic name meaning all available interfaces
PORT = 10000 # Arbitrary non-privileged port
print 'starting up on %s port %s' % (HOST, PORT)

vConnect = False
vLoop = 0
MAX_RETRY = 120

# !F! add max timeout
while ((vConnect == False) and (vLoop < MAX_RETRY) ):
    try:
        sock.bind((HOST, PORT))
        vConnect = True

    except:
        if (vLoop == 0):
            sys.stdout.write('Waiting')
        else:
            sys.stdout.write('.')


        time.sleep(1)
        vLoop += 1
        pass

print ""
if (vConnect == False):
    exit (1)

#print 'starting up on %s port %s' % server_address
#sock.bind(server_address)

# Listen for incoming connections
sock.listen(1)
data = ''

while True:
    # Wait for a connection
    print 'waiting for a connection'
    connection, client_address = sock.accept()

    try:
        print 'connection from', client_address

        # Receive the data in small chunks and retransmit it
        while True:
            print  'Waiting msg...'
            data = connection.recv(1000)

            #
            # Decrypt
            #
            print ("msg <%s>" % data)
            # Decryption
            #decryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
            #plain_text = decryption_suite.decrypt(data)
            plain_text = data

            print ("msg <%s>" % plain_text)
            data = plain_text
            #################

            if data:
                if ( data == 'cmd:shutdown'):
                    print  'shutdown - 1'
                    connection.sendall("999")
                    time.sleep(0.5)
                    connection.shutdown(socket.SHUT_RDWR)
                    connection.close()
                    print  'shutdown -2 '
                    break

                else:
                    msg_handling (data)

            else:
                print  'no more data from', client_address
                break

    finally:
        pass
        #connection.shutdown(socket.SHUT_RDWR)
        #connection.close()

    if data:
        if (data == 'cmd:shutdown'):
            break

print  'PRG ended'


# def main():
#     try:
#         execute_app()
#     finally:
#         handle_cleanup()
#
# if __name__=='__main__':
#     main()
#