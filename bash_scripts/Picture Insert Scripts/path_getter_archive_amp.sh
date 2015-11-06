#! /usr/bin/bash
cd /images/2014\ Archive/$folder
export path="$(ls -d "$PWD"/* | grep $SKU_input | sed -e 's!/2014 Archive!!' | grep _800.jpg | tr -d '\n' | head -c-8)"
echo $path | tr -d '\n' > /dev/clipboard