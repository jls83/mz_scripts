#! /usr/bin/bash
cd /cygdrive/c/Users/JSanders/Documents/Posted
export desc_file="Descriptions $date.txt"
export title_line="$(grep -n $SKU_input "$desc_file" | cut -d \: -f 1)"
export desc_line="$(expr $title_line + 2)"
export SKU_title="$(sed -n "$title_line p" "$desc_file" | tail -c +8 | tr -d '\n')"
export SKU_desc="$(sed -n "$desc_line p" "$desc_file" | tr -d '\n')"
export SKU_keyword="$(echo $SKU_title | sed "s/ /s /g")"
export SKU_keyword="${SKU_keyword}s"