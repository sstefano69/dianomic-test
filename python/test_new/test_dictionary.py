dict = {"01":  "msg 1"}



print " test <{v}>".format (v=dict["01"] )

dict["01"]= " changed"
print " test <{v}>".format (v=dict["01"] )

dict["02"]= " new"

print " test <{v}>".format (v=dict["02"] )

del dict["02"]

try:
    print " test <{v}>".format(v=dict["02"])
except:
    print "error"


