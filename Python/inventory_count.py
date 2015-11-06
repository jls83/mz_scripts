#! /usr/bin/python

import csv

q = open('C:/Users/JSanders/Documents/test.csv', 'rb') #Count file
r = open('C:/Users/JSanders/Documents/sku_upc.csv', 'rb') #UPC to SKU file

inventory = csv.reader(q)
sku_list = csv.reader(r)

inv_dict = {}

for i in inventory:
	key = i[0]
	count = int(i[1])
	if key in inv_dict:
		inv_dict[key] = inv_dict[key] + count
	else:
		inv_dict[key] = count
		
for j in sku_list:
	upc = j[0]
	sku = j[1]
	if upc in inv_dict:
		count = inv_dict[upc]
		print "Found via UPC: ", sku, upc, count
	elif sku in inv_dict:
		count = inv_dict[sku]
		print "Found via SKU: ", sku, upc, count