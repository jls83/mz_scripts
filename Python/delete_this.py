count = 0

try:
	for i in range(100):
		print i
		count += i
except:
	if i == 75:
		print "Seventy Five"
		count += i
finally:
	print count