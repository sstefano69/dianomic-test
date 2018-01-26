'''
Created on 25 mag 2016

@author: admin
'''
import sqlite3 

con = sqlite3.connect('c:\\tmp\\demo.db')
con.execute("""CREATE TABLE tbl ( id INTEGER PRIMARY KEY AUTOINCREMENT,grp INTEGER)""")
c = con.cursor()
c.execute("""INSERT INTO tbl (grp) VALUES (0);""")

newId = c.lastrowid

print "New rowid =", newId
c.close()
con.close()