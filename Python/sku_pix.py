#!/usr/bin/env python

import os
import csv
import sys

def FolderFinder(queue,input): #Queue is Doc CSV, Input is SKU to post
	folder = False
	for i in queue: #goes through each line...
		if input in i:	#determines if SKU input
			if 'Approved' not in i[4]: #exits script if pics not completed, and sets folder to False
				print "SKU in doc, but no approved pics" #lets the user know there aren't approved pics
				folder = False #sets folder to false for later use
				break
			else:	
				d = i[4].split()[1] #gets the date from "Approved %DATE%"
			folder = '/images/' + d + '/' #sets the folder to the date folder
	return folder			

def ListGetter(loc,input): #loc is folder from FolderFinder, input is the SKU
	pix_list = [] #starts with empty list
	dir = os.listdir(loc) # gets list of files contained in folder
	for j in dir: #iterates through generated file list
		sku_output = j.split('_')[0] #gets SKU from pics using naming convention (%SKU%_%Title%%_1...)
		if input == sku_output: #If we find the SKU in the split pic title
			path = loc + j	#takes the Folder name we provided, adds the filename from the list
			pix_list.append(path) #appends the generated path to the list
	return pix_list

def RearrangeFull(list):
	for position, f in enumerate(list): #Iterates through the list using the enumerate function, giving each item a position
		if f[-8:] == 'full.jpg': #if the last 8 characters are from the full pic
			if position != 0: #if the full pic isn't first in the list
				del list[position] #delete it from the list
				list.insert(0, f) #insert it at the first position
		elif f[-7:] == '250.jpg' or f[-7:] == '300.jpg': #if the last 7 characters are from the 250/300 pic
			if position != 0: #if the 250/300 pics aren't first
				del list[position] #delete it from the list
				list.insert(0, f) #insert it at the first position
	
if __name__ == "__main__":
	sku_input = raw_input("Enter SKU Number: ")

	posting_file = open('C:\Users\JSanders\Downloads\posting_doc.csv', 'rb')
	posting_doc = csv.reader(posting_file)

	folder = FolderFinder(posting_doc,sku_input)

	if folder:		
		sku_pix = ListGetter(folder,sku_input)
		RearrangeFull(sku_pix)
		for i in sku_pix:
			print i
	else:
		print "No Pics"
	
	posting_file.close()
# # 0 = full or 250/300
# # 1 = _1 or 800
# # 2 = _a
# # 3 = _b etc...