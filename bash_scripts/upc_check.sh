export dir=/cygdrive/c/Users/JSanders
cat $dir/Documents/update_upcs.txt | while read i
do	
	search="$(echo $i | head -c-2)"
	grep $search $dir/Downloads/tmz_sku_list_b.csv
done

echo Done