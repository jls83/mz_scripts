export dir=/cygdrive/c/Users/JSanders/Downloads
cat $dir/gtr_store_desc_new.csv | while read i
do
	item_part="$(echo $i | cut -d \, -f 2)"
	item_part2="$(echo $item_part | sed -e 's!GTR!!')"
	item_part3="$(echo $item_part | sed -e 's!GTR0!!' | sed -e 's!GTR!!')"
	item_sku="$(grep $item_part3 $dir/tmz_sku_list_b.csv | cut -d \, -f 1)"
	item_sku2="$(echo $item_sku | cut -d \  -f 1)"
	echo $i,$item_sku2 >> $dir/gtr_tmz_skus_a.csv
done

echo Done
