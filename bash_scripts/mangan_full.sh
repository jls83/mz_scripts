#! /usr/bin/bash
IFS='
'

for f in /images/2-12-15/Mangan\ fulls/*
do
	new_name="$(echo $f | cut -d \/ -f 5 | cut -d \. -f 1 | sed 's/'_a'/'_full'/g').jpg"
	echo "$new_name"
	cp $f /images/2-12-15/Mangan\ fulls/$new_name
done