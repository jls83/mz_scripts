#!/usr/bin/env python
import csv
query_dict=[]
full_dict=[]

with open('query.csv', 'r') as query, open('full.csv', 'r') as full:
	num = 0
	for a in query:
		query_dict[num] = a
	num = 0
	for b in full:
		full_dict[num] = b
	print query_dict[1]
		
		