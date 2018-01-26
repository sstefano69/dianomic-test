import re

str  = "OK - CAS1P  10.0.0.8 13306"
str2 = "One or more database nodes were unable to prepare for copying to a storage node"

matchObj = re.match('^OK', str,  )


if matchObj:
    print "test 1 ok <%s> " % matchObj.group()
else:
    print "no match "

if "OK" in str2:
    print "test 1 ok"

