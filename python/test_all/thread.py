'''
Created on 25 mag 2016

@author: admin
'''
import threading
import time

gText = 90;

class thread_test (threading.Thread):
    def run(self):     
        global gText
   
        gText = 80
        time.sleep( 2 )    
        print ("Thread",threading.currentThread().getName()  )
        time.sleep( 15 )
        print ("Thread 2" ,threading.currentThread().getName())
        
def display_results():
    print ("Thread")

threads = []

print ("0", gText)


v = thread_test (name="t1")
v2 = thread_test (name="t2")

v.start ()
time.sleep( 2 )
v2.start ()

print ("1", gText)

threading.Thread( target = display_results ) 
print ("ONE")

