'''
Created on 25 mag 2016

@author: admin
'''
import threading
import time

def worker():
    """thread worker function"""
    time.sleep(10)
    print 'Worker'
    return

#threads = []

t = threading.Thread(target=worker)
#threads.append(t)
t.start()
t.join()
print 'main'
