from Crypto.Cipher import AES


# Encryption
encryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')


vText = "A really sec "
vLen = len (vText)
vLen16 = int(vLen / 16)
vLenTot = (vLen16 +1) * 16
vToPad = vLenTot - vLen

vMsgNew = vText.ljust(vLenTot, ' ')

print ("Len %d " % vLen)
print ("Len %d " % vLenTot)
print ("Len %d " % vToPad)
print ("msg <%s>" % vMsgNew)

cipher_text = encryption_suite.encrypt(vMsgNew)


print ("msg <%s>" % cipher_text)
# Decryption
decryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
plain_text = decryption_suite.decrypt(cipher_text)

print ("msg <%s>" % plain_text)