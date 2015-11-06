#! /usr/bin/python

import csv

tally_yes = {}
tally_no = {}
tally_blk = {}

def ListSplitter(src): #Breaks down the multiple choices from a single cell into individual items
	d = src.split(',') #split the comma separated choices
	e = []
	for i in d:
		if i[0] == ' ': #remove leading space
			i = i[1:]
			e.append(i)
		else:
			e.append(i)
	return e
	
def Tally(src,dict): #takes some dict, checks for a key and adds quantity to the associated value
	for sub in src:
		for i in sub:
			if i not in dict: #adds single item to key if not present
				dict[i] = 1
			else:
				dict[i] += 1 #adds one to key's value
	return dict

q = open("C:/Users/JSanders/Downloads/Rice Cultivation Society T-Shirt Survey (Responses) - Form Responses 1.csv", 'rb')
poll = csv.reader(q)

for i in poll:
	shirt_yes_mult = i[1]
	shirt_no_mult = i[2]
	shirt_blk_mult = i[3]
	
	shirt_yes = ListSplitter(shirt_yes_mult)
	shirt_no = ListSplitter(shirt_no_mult)
	shirt_blk = ListSplitter(shirt_blk_mult)
	
	tally_yes = Tally(shirt_yes, tally_yes)
	
for j in tally_yes:
	print j, tally_yes[j]

