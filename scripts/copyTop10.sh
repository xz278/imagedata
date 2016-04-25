#! /bin/bash
# input 1: stats file
# input 2: image file
top10=$(head -10 $1 | cut -d"," -f1 | tr '\n' ' ')
arr=($top10)
newPath="top10"
if [[ -d $newPath ]]; then
	rm -r $newPath
fi
mkdir $newPath
for var in ${arr[@]}; do
	if [[ -d $2"/"$var ]]; then
		cp -r $2"/"$var $newPath"/"$var
	fi
done