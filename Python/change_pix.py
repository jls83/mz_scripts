#!/usr/bin/env python

import os

folder = 'C:\Users\JSanders\Downloads\change_pix'

pix_list = os.listdir(folder)

sku_replace = {'8221':'24963','22300':'23299'} #old:new

for i in pix_list:	
	sku = i.split('_')[0]
	length = len(sku)
	old_name =  folder + '\\' + i
	new_name =  folder + '\\' + sku_replace[sku] + i[length:]
	print new_name
	os.rename(old_name,new_name)