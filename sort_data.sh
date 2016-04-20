#!/bin/bash
# input 1 is the image label: new_label.csv
# input 2 is the data folder


IFS=","
newPath="new_data/"

if [[ ! -e "$newPath" ]]; then
	mkdir "$newPath"
fi

echo "Processing..."

while read line; do
	arr=($line)
	img=${arr[0]}
	cate=${arr[1]}
	moveTo="$newPath$cate"
	if [[ ! -e "$moveTo" ]]; then
		mkdir "$moveTo"
	fi
	cp "$2/$img" "$moveTo"
done < "$1"

echo "Completed."