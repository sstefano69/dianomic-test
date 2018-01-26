import sys

for vref in sys.path:
    print (vref)

for vIndex, vNode in enumerate(sys.modules):
    print (vIndex +1, vNode)    

  
        