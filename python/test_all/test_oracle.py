'''
Created on 24 mag 2016

@author: admin
'''
import cx_Oracle
con = cx_Oracle.connect('pythonhol/welcome@127.0.0.1/orcl')
  
                
print con.version
              
con.close()