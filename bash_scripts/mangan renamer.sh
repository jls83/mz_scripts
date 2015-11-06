#! /usr/bin/bash
IFS='
'

search_path=/cygdrive/c/Users/JSanders/Documents/Curt_Mangan/${folder}/

for f in ${search_path}*.jpg
do
	part_num="$(echo "$f" | cut -d \/ -f 9 | cut -d \. -f 1)"
	SKU_line="$(grep $part_num /cygdrive/c/Users/JSanders/Documents/Curt_Mangan/POS_SKUs.csv)"
	SKU_input="$(echo $SKU_line | cut -d \, -f 1)"
	SKU_title="$(echo $SKU_line | cut -d \, -f 2 | sed -e 's/\ /_/g')"
	new_name="${SKU_input}_${SKU_title}_${part_num}.jpg"
	new_name="$(echo $new_name | sed -e 's!\/!_!g')"
	echo $new_name
	cp $f ${search_path}/${new_name}
done