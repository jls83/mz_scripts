export dir=/cygdrive/c/Users/JSanders/Downloads
cat $dir/shipment_1.csv | while read i
do
	item_upc="$(echo $i | cut -d \, -f 5)"
	item_sku="$(grep $item_upc $dir/tmz_sku_list_a.csv | cut -d \, -f 1)"
	item_data="$(grep $item_upc $dir/tmz_sku_list_a.csv | cut -d \, -f 2,3,6)"
	#echo $item_upc
	#echo $item_sku
	#echo $item_sku,$item_data
	echo "$i,$item_sku,$item_data" >> $dir/gtr_tmz_skus_updated.csv
done

echo Done