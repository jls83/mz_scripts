#! /usr/bin/env python

import os
from collections import Counter



# Begin Function Definitions

def SKUCounter(src,dir): #takes the day's file and spits out number of entries
	posted_date = src.split(' ')[1].split('.')[0] #splits file name and gets date created
	src_file = dir + src	
	#print src_file
	with open(src_file) as f: #opens description file as f
		total = 0
		for i in f:
			a = i.count(' - ')
			total = total + a
	return total, posted_date
	
def CompletedList(dir): #gives list of description files from a directory
	dst = [] #empty list to start
	src = os.listdir(dir) #get master list of directory
	for i in src: #iterate through all filenames
		if i.split(' ')[0] == "Descriptions": #if file is a description file...
			dst.append(i) #add it to the list
	return dst #return list of description files
			
# End Functinon Definitions

posted_dir = '/cygdrive/c/Users/JSanders/Documents/Posted/'
archive_dir = '/cygdrive/c/Users/JSanders/Documents/Posted/Archive/'

posted_list = CompletedList(posted_dir) #gets list of description files in main posted dir
archive_list = CompletedList(archive_dir) #from archive dir

#print SKUCounter(posted_list[0],posted_dir)

post_dict = {}

for i in posted_list:
	#print i
	t, d = SKUCounter(i, posted_dir)
	post_dict[d] = t
	
for j in archive_list:
	#print i
	t, d = SKUCounter(j, archive_dir)
	post_dict[d] = t
	
sum = 0
count = 0.0
for i in post_dict:
	sum = sum + post_dict[i]
	count += 1
	print "On " + str(i) + ", " + str(post_dict[i]) + " SKUs were posted"
	
print sum
print count
print sum / count