'''
Created on 25 mag 2016

@author: admin
'''

import Tkinter  
import tkMessageBox

def helloCallBack():
   tkMessageBox.showinfo( "Hello Python", "Hello World")


 

top = Tkinter.Tk()
# Code to add widgets will go here...

tkMessageBox.showinfo( "Hello Python", "Hello World")


var = Tkinter.StringVar()
w = Tkinter.Label ( top, textvariable=var , relief=Tkinter.RAISED ) 
var.set("Hey!? How are you doing?")
w.pack()

B = Tkinter.Button(top, text ="Hello", command = helloCallBack)
B.pack()

# Label
L1 = Tkinter.Label(top, text="User Name")
L1.pack( side = Tkinter.LEFT)
E1 = Tkinter.Entry(top, bd =5)
E1.pack(side = Tkinter.RIGHT)

# LIstbox
Lb1 = Tkinter.Listbox(top)
Lb1.insert(1, "Python")
Lb1.insert(2, "Perl")
Lb1.insert(3, "C")
Lb1.insert(4, "PHP")
Lb1.insert(5, "JSP")
Lb1.insert(6, "Ruby")
Lb1.pack()


top.mainloop()

print ("Test")


 