#!/usr/bin/env python

from Tkinter import *

def load_sku():
	sku_input = e1.get()
	print sku_input
	print var_info.get()
	print var_pics.get()


master = Tk()

Label(master, text="SKU Input").grid(row=0)

e1 = Entry(master)

e1.grid(row=0, column=1)

var_info = IntVar()
var_pics = IntVar()

Checkbutton(master, text="SKU Info", variable=var_info).grid(row=6, sticky=W)
Checkbutton(master, text="SKU Pics", variable=var_pics).grid(row=7, sticky=W)


Button(master, text='Show', command=load_sku).grid(row=3, column=0, sticky=W, pady=4)
Button(master, text='Quit', command=master.quit).grid(row=4, column=0, sticky=W, pady=4)


mainloop()