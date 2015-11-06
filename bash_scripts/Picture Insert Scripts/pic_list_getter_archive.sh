#! /usr/bin/bash
ls /images/20$SKU_year\ Archive/$folder | grep $SKU_input | sed '1d' | sed '$d' > /images/20$SKU_year\ Archive/$folder"$SKU_input"_pix
cat /images/20$SKU_year\ Archive/$folder"$SKU_input"_pix