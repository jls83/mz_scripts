import csv
import os
import datetime

am_pm_list = ['AM', 'PM', 'am', 'pm']
am_pm = raw_input("AM or PM Update?: ")

if am_pm not in am_pm_list:
	print "Please Select AM or PM"
	am_pm = raw_input("AM or PM Update?: ")

update_folder = '/cygdrive/c/Users/JSanders/Documents/CA Updates/' # set to folder where updates are saved
today = datetime.date.today() # generates today's date in a YYYY-MM-DD format
read_file = open(update_folder + 'Download/' + str(today) + '.csv', 'rb') # opens the downloaded file

try: # opens the downloaded csv, reads content into a list, then closes the file with a finally statement
	read_csv = list(csv.reader(read_file)) # reads the csv into a list of lists
	del read_csv[:5] # removes the "Music Zoo" header
	del read_csv[-3:-1]
finally:
	read_file.close() #make sure to close the file
	
write_list = [] # create a blank list to append the new rows to

for row in read_csv: # removes the blank cells, as well as the MSRP and Cost cells
	new_row = [ row[1], row[3], row[5], 'unshipped']
	if new_row[0]: # if there is a sku in the cell
		write_list.append(new_row) # appends the row to the new write_list list
	
pricing_header = [ 'Quantity', 'Inventory Number', 'Buy It Now Price', 'Quantity Update Type']
reverb_header = [ 'inventory', 'sku', 'price', 'blah_field']

write_list[0] = pricing_header # replaces top row with row for TMZ pricing update

pricing_file = open(update_folder + 'TMZ_Update_' + am_pm + '_' + str(today) + ' Pricing.txt', 'w+')
normal_file = open(update_folder + 'TMZ_Update_' + am_pm + '_' + str(today) + '.txt', 'w+')
reverb_file = open(update_folder + 'TMZ_Update_' + am_pm + '_' + str(today) + ' Reverb.csv', 'w+')

print "Generating TMZ Update"
try: # creates the pricing update file for TMZ
	writer = csv.writer(pricing_file, delimiter='\t')
	for i in write_list:
		writer.writerow(i)
finally:
	pricing_file.close() #close and save the pricing file

print "Generating eBay Store Update"
try: # creates the non-pricing update file
	writer = csv.writer(normal_file, delimiter='\t')
	for i in write_list:
		edit = [ i[0], i[1], i[3] ]
		writer.writerow(edit)
finally:
	normal_file.close() #close and save the pricing file

print "Generating Reverb Update"
try: # creates the reverb update file
	writer = csv.writer(reverb_file, delimiter=',')
	edit_list = write_list
	edit_list[0] = reverb_header
	for i in edit_list:
		edit = [ i[0], i[1], i[2] ]
		writer.writerow(edit)
finally:
	reverb_file.close() #close and save the pricing file

print "Update Creation Complete"