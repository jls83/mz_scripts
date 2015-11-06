cat /cygdrive/c/Users/JSanders/Documents/fender_kmc_skus_no_upc.csv | while read line
do
	#echo $line
	SKU_part="$(echo $line | cut -d \, -f 2)"
	SKU_input="$(echo $line | cut -d \, -f 1)"
	#echo ${SKU_part},${SKU_input}
	update_line="$(grep -a $SKU_part /cygdrive/c/Users/JSanders/Documents/fender_pricing_update.csv)"
	#update_line=",${update_line}"
	#echo "$SKU_input"
	#echo "$update_line"
	echo "${SKU_input},${update_line}"
	echo "${SKU_input},${update_line}" >> /cygdrive/c/Users/JSanders/Documents/fender_update
done