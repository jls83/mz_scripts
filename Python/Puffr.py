#!/usr/bin/env python

from sku_list import *
from sku_pix import *
import sys

def InfoCreator(input):
	date_created = DateCreator()
	date_created = ListChecker(input,date_created)	
	file_desc = 'C:\Users\JSanders\Documents\Posted\Descriptions ' + date_created + '.txt'
	sku_desc = InfoSplit(file_desc)
	file_list = 'C:\Users\JSanders\Documents\Posted\Lists ' + date_created + '.html'
	sku_list = InfoSplit(file_list)
	sku_info = KludgeFactory(sku_desc,sku_list,sku_input)
	for i in sku_info:
		print i

def PixCreator(input):
	posting_file = open('C:\Users\JSanders\Downloads\posting_doc.csv', 'rb')
	posting_doc = csv.reader(posting_file)
	folder = FolderFinder(posting_doc,input)
	filelist = os.listdir(folder)
	sku_pix = ListGetter(folder,input)
	RearrangeFull(sku_pix)	
	for x in sku_pix:
		print x


if len(sys.argv) > 1:
	sku_input = sys.argv[1]
else:
	sku_input = raw_input("Enter SKU Number: ")
print "\nEnter 1 for Description and Specs\nEnter 2 for Pictures\nEnter 3 for All\n"

task_select = raw_input("Please Choose An Option: ")

if task_select == '1' or task_select == '3':
	InfoCreator(sku_input)

if task_select == '2' or task_select == '3':
	PixCreator(sku_input)

if task_select == 'exit' or task_select == 'Exit':
	print 'Thanks for using Puffr!'
	sys.exit()
