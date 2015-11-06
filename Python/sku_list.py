#!/usr/bin/env python

import datetime
import sys

info_dict = {}

global month
global day

def DateCreator():
	today = datetime.datetime.today()
	global date_created
	global month
	global day
	if today.strftime('%m')[0] == '1':
		month = today.strftime('%m')
	else:
		month = today.strftime('%m')[1]

	if today.strftime('%d')[0] != '0':
		day = today.strftime('%d')
	else:
		day = today.strftime('%d')[1]
	
	date_created = month + '-' + day
	return date_created

def ListChecker(input,input_date):
	global date_created
	if input not in open('C:\Users\JSanders\Documents\Posted\Descriptions ' + input_date + '.txt').read():
		input_date = raw_input("Description date_created (m-d format), or type 'exit' to Exit: ")
		date_created = input_date
	if input_date == 'exit' or input_date == 'Exit':
		sys.exit()
	return date_created

def InfoSplit(src):
	split = open(src)
	dst = split.read()
	dst = dst.split('\n\n\n')
	return dst

def KludgeFactory(desc,list,input):
	for i in desc:
		sku_header, sku_desc = i.split('\n\n')
		sku_num, sku_title = sku_header.split(' - ')
		sku_keywords = sku_title.replace(' ', 's ') + 's'
		info_dict[sku_num] = [sku_title,sku_keywords,sku_desc]

	for j in list:
		if input not in j:
			info_dict[sku_num].append('<!-- No spec list -->')
		else:
			sku_num, sku_list = j.split('\n\n<u')
			sku_list = '<u' + sku_list
			if input == sku_num:
				info_dict[sku_num].append(sku_list)
	return info_dict[input]

if __name__ == "__main__":
	sku_input = raw_input("Enter SKU Number: ")

	date_created = DateCreator()

	date_created = ListChecker(sku_input,date_created)

	file_list = 'C:\Users\JSanders\Documents\Posted\Lists ' + date_created + '.html'
	file_desc = 'C:\Users\JSanders\Documents\Posted\Descriptions ' + date_created + '.txt'
		
	#print file_list
	sku_desc = InfoSplit(file_desc)
	sku_list = InfoSplit(file_list)
	
	#print sku_list
	
	sku_info = KludgeFactory(sku_desc,sku_list,sku_input)

	#sku_info = info_dict[sku_input]

	for i in sku_info:
		print i
	
# 0 = Title
# 1 = Description
# 2 = Keywords
# 3 = Specs List
