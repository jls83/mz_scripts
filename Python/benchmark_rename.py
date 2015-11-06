#! /usr/bin/env python

import sys

def TitleSplit(title):
	benchmark_keys = "benchmarks 10ths tenths anniversaries annivs anniversarys lps lp's chambers"
	t_list = title.split(' ')
	color_pos = t_list.index('Guitar') + 1
	color = ' '.join(t_list[color_pos:])
	year = t_list[4]
	ri_number = "R" + year[-1] + "s"
	n_title = "Gibson Custom Shop " + year + " Les Paul Chambered Reissue Electric Guitar " + color
	keywords = n_title.replace(' ', 's ') + 's'
	n_keywords = keywords + " " + benchmark_keys + " " + ri_number
	return (n_title, n_keywords)

if len(sys.argv) > 1:
	sku_title = sys.argv[1]
else:
	sku_title = raw_input("Title: ")
	
new_info = TitleSplit(sku_title)

option = sys.argv[2]

if option == "1":
	print new_info[0] #returns actual title
elif option == "2":
	print new_info[1] #returns keywords