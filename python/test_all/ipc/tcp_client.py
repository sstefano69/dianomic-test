import socket
import sys
import time
import getopt
from Crypto.Cipher import AES

########################################################################################################################
# Functions

def cmd_send (vCmd):
    global sock
    try:
        # Send data
        print  'sending "%s"' % vCmd
        sock.sendall(vCmd)

        vExecution = sock.recv(1000)
        print   'execution "%s"' % vExecution
        return (vExecution)

    finally:
        pass


########################################################################################################################
# Main






# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#server_address = ('localhost', 10000)
server_address = ('192.168.1.101', 10000)
print   'connecting to %s port %s' % server_address
sock.connect(server_address)

vCmd = "ls -l /tmp      "
#vCmd = "ls -l /tmp"

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#server_address = ('localhost', 10000)
server_address = ('192.168.1.101', 10000)
print   'connecting to %s port %s' % server_address
sock.connect(server_address)

# Encryption
encryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
cipher_text = encryption_suite.encrypt(vCmd)

#print ("msg <%s>" % vCmd)
print ("msg <%s>" % cipher_text)


# Command exec
cmd_send (cipher_text)
#cmd_send (vCmd)




print  'closing socket'
time.sleep(0.5)
sock.shutdown(socket.SHUT_RDWR)
sock.close()
