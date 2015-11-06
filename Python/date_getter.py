#!/usr/bin/env python

import datetime

today = datetime.datetime.today()

if today.strftime('%m')[0] == '1':
	month = today.strftime('%m')
else:
	month = today.strftime('%m')[1]

if today.strftime('%d')[0] == '1':
	day = today.strftime('%d')
else:
	day = today.strftime('%d')[1]

date = month + '-' + day
print date