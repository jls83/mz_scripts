#!/usr/bin/env python

def RemoveSpace(src):
	dst = []
	for iter in src:
		if iter[0] == ' ':
			dst.append(iter[1:])
			#print iter
		else:
			dst.append(iter)
	return dst
	
test = ['test', ' this', '  other']

print RemoveSpace(test)
