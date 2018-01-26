import socket
import sys

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
server_address = ('192.168.1.105', 10000)
print   'connecting to %s port %s' % server_address
sock.connect(server_address)


# Good Exevution
cmd_send ('ls -l /tmp')

# Bad Exevution
cmd_send ('ls -l /tmp2')

# Terminate
cmd_send ('shutdown')

print  'closing socket'
sock.shutdown(0)
sock.close()
