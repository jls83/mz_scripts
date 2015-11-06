export dir=/cygdrive/c/Users/JSanders/Downloads
cat $dir/updated.csv | while read i
do	
	item_upc="$(echo $i | cut -d \, -f 5)"
	item_part="$(echo $i | cut -d \, -f 1)"
	item_part2="$(echo $item_part | tail -c+4)"
	item_title="$(echo $i | cut -d \, -f 2 | tail -c+2)"
	item_dept="$(echo $i | cut -d \, -f 3)"
	item_sku="$(echo $i | cut -d \, -f 7)"
	item_qty="$(echo $i | cut -d \, -f 6)"
	item_data="$(grep $item_part $dir/gtr_store_desc.csv)"
	item_desc="$(echo $item_data | cut -d \, -f 11)"
	item_cost="$(echo $item_data | cut -d \, -f 9)"
	item_msrp="$(echo $item_data | cut -d \, -f 8)"
	#echo $item_part2
	#echo "$item_sku,$item_title,$item_dept,$item_desc,$item_cost,$item_msrp,$item_upc,$item_qty,$item_part2"
	echo "$item_sku,$item_title,$item_dept,$item_desc,$item_cost,$item_msrp,$item_upc,$item_qty,$item_part2" >> $dir/upload.csv
done

echo Done