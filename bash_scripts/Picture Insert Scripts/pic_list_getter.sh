#! /usr/bin/bash
ls /images/"$folder" | grep $SKU_input | sed '1d' | sed '$d' > /images/"$folder"/"$SKU_input"_pix
cat /images/"$folder"/"$SKU_input"_pix