cat /cygdrive/c/Users/JSanders/Documents/fender_kmc_skus.csv | while read line
do
	#echo $line
	SKU_upc="$(echo $line | cut -d \, -f 3 | sed 's!^.!!')"
	SKU_input="$(echo $line | cut -d \, -f 1)"
	#echo ${SKU_upc},${SKU_input}
	update_line="$(grep -a $SKU_upc /cygdrive/c/Users/JSanders/Documents/fender_pricing_update.csv | sed 's!^.!!')"
	#echo $update_line
	echo "${SKU_input},${update_line}"
	echo "${SKU_input},${update_line}" >> /cygdrive/c/Users/JSanders/Documents/fender_update
done