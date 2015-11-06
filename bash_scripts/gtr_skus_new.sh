export dir=/cygdrive/c/Users/JSanders/Downloads
cat $dir/gtr_items.csv | while read i
do
	item_part="$(echo $i | cut -d \, -f 1)"
	item_data="$(grep $item_part $dir/tmz_sku_list_b.csv)"
	item_sku="$(echo $item_data | cut -d \, -f 1)"
	item_sku2="$(echo $item_sku | cut -d \  -f 1)"
	item_qty="$(echo $item_data | cut -d \, -f 2)"
	item_web="$(echo $item_data | cut -d \, -f 3)"
	item_upc="$(echo $item_data | cut -d \, -f 5)"
	item_rcvd="$(echo $item_data | cut -d \, -f 7)"
	echo $i,$item_sku2,$item_qty,$item_web,$item_rcvd >> $dir/gtr_tmz_skus_325.csv
done

echo Done
