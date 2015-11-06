#! /usr/bin/env python

import os, csv, datetime
from datetime import datetime

completed = '/cygdrive/c/Users/JSanders/Downloads/Consignments and Trades Write Up Form (Responses) - Completed.csv' #download the completed sheet
incomplete = '/cygdrive/c/Users/JSanders/Downloads/Consignments and Trades Write Up Form (Responses) - Form Responses 1.csv' #download the response sheet

c_open = open(completed, 'rb') #open the file for reading
i_open = open(incomplete, 'rb') #open the file for reading

response_list = [] #create a blank list to append sheet contents to
lag_dict = {}
sell_dict = {}

try:
	day_count = 0
	sell_total = 0 #i[12]
	cost_total = 0 #i[13]
	c_list = list(csv.reader(c_open)) #create list of lists from csv file
	i_list = list(csv.reader(i_open))
	del c_list[0]
	del i_list[0]
	response_list = c_list + i_list #bring together the lists
	date_format = date_format = "%m/%d/%Y"
	for i in response_list: #iterate over created lists
		res_date = i[0].split(' ')[0] # split first cell on a space to get date submitted
		if len(i[5]) > 3: # if there's a date in the created by cell
			cre_date = i[5].split(' ')[1] #split using a space
			cre_date = cre_date.replace('-','/') #replace dashes with slashes for consistency
			if cre_date.split('/')[-1] == '15': #expand '15' to '2015' for consistency
				cre_date = cre_date[:-2] + '2015'
		else:
			cre_date = res_date #put in a ridiculously high date to help sort out errors
		r_dt = datetime.strptime(res_date, date_format) #turns dates into datetime objects
		c_dt = datetime.strptime(cre_date, date_format)
		lag = c_dt - r_dt #number of days between the response date and the creation date
		lag_dict[ i[4] ] = lag.days 
		day_count = day_count + int(lag.days) # total number of days lag
		sell_total = sell_total + float(i[12].replace('$','').replace(',',''))
		cost_total = cost_total + float(i[13].replace('$','').replace(',','').split(' ')[0])
	print "SKU creation time is", float(day_count) / len(response_list), "days on average"
	high = max(lag_dict, key=lag_dict.get)
	print high, "took", lag_dict[high], "days"
	print "Total cost of items: ", cost_total
	print "Total sell price of items: ", sell_total
finally:
	c_open.close() #close files
	i_open.close()