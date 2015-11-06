#!/usr/bin/env python
def taylor_decoder(sn):	
	if sn[0] == "1":
		factory = "El Cajon"
	elif sn[0] == "2":
		factory = "Tecate"
	
	if sn[8] == "1":
		suffix = "th"
	elif sn[9] == "1":
		suffix = "st"
	elif sn[9] == "2":
		suffix = "nd"
	elif sn[9] == "3":
		suffix = "rd"
	else:
		suffix = "th"
		
	if sn[7] != "0":
		order = sn[7:]
	else:
		order = sn[8:]
	
	print 'This Taylor was the ' + order + suffix + ' guitar made on ' + sn[2:4] + '/' + sn[4:6] + '/' + '20' + sn[1:2] + sn[6:7] + ' at the ' + factory + ' factory.'
	return

serial = raw_input("Enter Taylor Serial Number: ")

taylor_decoder(serial)