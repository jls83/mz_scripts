#! /usr/bin/bash
IFS='
'

search_path=/cygdrive/c/Users/JSanders/Documents/Curt_Mangan/${folder}/

for f in /cygdrive/c/Users/JSanders/Documents/Curt_Mangan/Upload/*.jpg
do
	old_title="$(echo $f | cut -d \/ -f 9 | cut -d \. -f 1)"
	new_title="${old_title}_a.jpg"
	echo $new_title
	cp $f /cygdrive/c/Users/JSanders/Documents/Curt_Mangan/Upload/${new_title}
done