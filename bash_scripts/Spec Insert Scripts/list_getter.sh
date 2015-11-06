#!/usr/bin/bash
export SKU_input
export list_file="/cygdrive/c/Users/JSanders/Documents/Posted/Lists $date.html"
export list_line="$(grep -n "$SKU_input" "$list_file" | cut -d \: -f 1)"
export list_end="$(tail -n +"$list_line" "$list_file" | grep -n -m 1 \<\/ul\> | cut -d \: -f 1)"
export SKU_list="$(tail -n +"$list_line" "$list_file" | sed -n "3,"$list_end" p")"