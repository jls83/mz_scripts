#!/usr/bin/env python

import os
import csv
import string
import shutil

file_list2 = []
tbl1 = string.maketrans(' ','_')
directory = 'C:\Users\JSanders\Downloads\Martin Strings\Stock Images\\'

m = open('C:\Users\JSanders\Documents\martin_strings.csv', 'rb')
sku_list = csv.reader(m)

filelist = os.listdir(directory)

for i in filelist:
	s = i.split('.')[0]
	file_list2.append(s)
	

for i in sku_list:
	x = i[2]
	if x in file_list2:
		desc = i[1].translate(tbl1)
		desc = desc.translate(None,'/')
		desc = desc.translate(None,'\'')
		new_name = i[0] + "_" + desc + i[2] + '.png'
		src = directory + x + '.png'
		dest = directory + new_name
		shutil.copy2(src, dest)
		print 'done'
		

#for i in filelist:
#	print i.split('.')[0]