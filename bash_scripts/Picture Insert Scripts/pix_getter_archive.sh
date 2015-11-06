#! /usr/bin/bash
cd /images/2014\ Archive/$folder
touch $SKU_input\_pix
ls -d "$PWD"/* | grep $SKU_input | sed -e 's!/2014 Archive!!' | sed '1d' > $SKU_input\_pix
# Starting to get the _1 and full images
export pix_1="$(grep _1.jpg $SKU_input\_pix)"
export pix_full="$(grep full.jpg $SKU_input\_pix)"
export one_line="$(grep -n _1.jpg $SKU_input\_pix | cut -d \: -f 1)"
sed -i "${one_line}d" $SKU_input\_pix
export full_line="$(grep -n full.jpg $SKU_input\_pix | cut -d \: -f 1)"
sed -i "${full_line}d" $SKU_input\_pix