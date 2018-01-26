class cstruct:
    var_i = 0
    var_f = 0.0
    var_str = ""
    values = ""   # list cannot be initialized here!


obj_array = [cstruct() ]
obj_array.append(cstruct())

obj_array[0].var_i = 10
obj_array[0].var_f = 10.00
obj_array[0].var_str = "ten"
obj_array[0].values = []
obj_array[0].values.append(1)
obj_array[0].values[0]=21
obj_array[0].values.append(1)
obj_array[0].values[1]=103

obj_array.append(cstruct())

obj_array[1].var_i = 10
obj_array[1].var_f = 10.00
obj_array[1].var_str = "ten"
obj_array[1].values = []
obj_array[1].values.append(1)
obj_array[1].values[0]=212
obj_array[1].values.append(1)
obj_array[1].values[1]=1033


obj_array.append(cstruct())

#go ahead and fill rest of array instaces of struct

#print all the value
for i in range(2):
    print "cstruct: obj_array i=%d f=%f s=%s - list=%s - list=%s" %(obj_array[i].var_i, obj_array[i].var_f, obj_array[i].var_str , obj_array[i].values[0] , obj_array[i].values[1])