#! /usr/bin/bash
export folder="$(grep $SKU_input /cygdrive/c/Users/JSanders/Downloads/posting_doc.csv | cut -d \, -f 5 | cut -d ' ' -f 2 | tr -d '\n')"
echo $folder | tr -d '\n'> /dev/clipboard