cat /cygdrive/c/Users/JSanders/Documents/fender_no_upc.txt | while read line
do
	SKU_input="$(echo $line)"
	#echo $SKU_input
	part_num="$(grep -a $SKU_input /cygdrive/c/Users/JSanders/Documents/fender_kmc_skus.csv | cut -d \, -f 3)"
	#echo "$part_num"
	#grep -a -s $part_num /cygdrive/c/Users/JSanders/Documents/fender_pricing_update.csv
	update_line="$(grep -a -s $part_num /cygdrive/c/Users/JSanders/Documents/fender_pricing_update.csv)"
	#echo "$update_line"
	echo "${SKU_input},${update_line}"
	echo "${SKU_input},${update_line}" >> /cygdrive/c/Users/JSanders/Documents/fender_update_2
done