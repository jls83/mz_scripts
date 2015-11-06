#!/usr/bin/env python

import csv

posting_file = 'C:\Users\JSanders\Downloads\posting_doc.csv'

p = open(posting_file, 'rb')

sku_input = '23307'

posting_doc = csv.reader(p)

for i in posting_doc:
	if sku_input in i:
		folder = i[4].split()[1]
	
print folder