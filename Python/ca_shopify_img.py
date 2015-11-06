#! /usr/bin/env python

#takes the img source columns from the CA export and turns them into rows for Shopify upload

import csv
import os

file = '/cygdrive/c/Users/JSanders/Documents/Shopify/CSV Uploads/Shopify Upload 2015-08-26.csv'
new_file = '/cygdrive/c/Users/JSanders/Documents/Shopify/CSV Uploads/Shopify Upload 2015-08-26 edited.csv'

new_list = []

f = open(file, 'rb')
new_f = open(new_file, 'wb')

f_read = csv.reader(f)
row_list = []

for row in f_read:
	row_list.append(row)

for i in row_list:
	if i[24] == 'product_image_1':	
		new_list.append([i[0]] + i[1:24] + ['Image Src'] + i[34:])
	elif not i[25]:		
		new_list.append([i[0]] + i[1:24] + [i[24]] + i[34:])
	else:
		new_list.append([i[0]] + i[1:24] + [i[24]] + i[34:])
		for j in i[25:34]:
			if not j:
				break
			else:				
				new_list.append([i[0]] + ([''] * 23) + [j] + ([''] * 19))

for g in new_list:
	file_writer = csv.writer(new_f, delimiter=',', quoting=csv.QUOTE_MINIMAL)
	file_writer.writerow(g)

f.close()
new_f.close()