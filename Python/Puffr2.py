#!/usr/bin/env python

from sku_list import *
from sku_pix import *
from Tkinter import *

def InfoCreator(input):
	date_created = DateCreator()
	date_created = ListChecker(input,date_created)
	file_list = 'C:\Users\JSanders\Documents\Posted\Lists ' + date_created + '.html'
	file_desc = 'C:\Users\JSanders\Documents\Posted\Descriptions ' + date_created + '.txt'		
	sku_desc = InfoSplit(file_desc)
	sku_list = InfoSplit(file_list)
	KludgeFactory(sku_desc,sku_list,sku_input)
	sku_info = info_dict[sku_input]	
	for i in sku_info:
		print i

def PixCreator(input):
	posting_file = open('C:\Users\JSanders\Downloads\posting_doc.csv', 'rb')
	posting_doc = csv.reader(posting_file)
	folder = FolderFinder(posting_doc,input)
	filelist = os.listdir(folder)
	ListGetter(filelist,input)
	RearrangeFull(pix_list)	
	for x in pix_list:
		print x

def DisplayGenerator():
	sku_input = e1.get()
	a = var_info.get()
	b = var_pics.get()
	print 'SKU Input: ', sku_input
	print 'A: ', a
	print 'B: ', b
	if a == 0 and b == 0:
		print "Please select an actual option"
	elif a == 1 and b == 0:
		InfoCreator(input)
	elif a == 0 and b == 1:
		PixCreator(input)
	elif a == 1 and b == 1:
		InfoCreator(input)
		PixCreator(input)

master = Tk()

Label(master, text="SKU Input").grid(row=0)

e1 = Entry(master)

e1.grid(row=0, column=1)

var_info = IntVar()
var_pics = IntVar()

Checkbutton(master, text="SKU Info", variable=var_info).grid(row=6, sticky=W)
Checkbutton(master, text="SKU Pics", variable=var_pics).grid(row=7, sticky=W)

Button(master, text='Show', command=DisplayGenerator).grid(row=3, column=0, sticky=W, pady=4)
Button(master, text='Quit', command=master.quit).grid(row=4, column=0, sticky=W, pady=4)
	
mainloop()