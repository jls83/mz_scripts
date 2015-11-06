#!/usr/bin/env python
list = []
flist = []


for i in range(0, 10):
	for f in range (10, 20):
		print i
		list.append(i)
		print f
		flist.append(f)

print list
print len(list)
print flist
print len(flist)