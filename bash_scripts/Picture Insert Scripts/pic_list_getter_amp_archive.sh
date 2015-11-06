#! /usr/bin/bash
export folder="$(grep $SKU_input /cygdrive/c/Users/JSanders/Downloads/posting_doc.csv | cut -d \, -f 5 | cut -d ' ' -f 2 | tr -d '\n')"
ls /images/$folder | grep $SKU_input | sed '1,2d' > /images/$folder/"$SKU_input"_pix
cat "$SKU_input"_pix