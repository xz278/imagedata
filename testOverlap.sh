#! /bin/bash
if [[ "$#" -ne 2 ]] || [[ ! -d "$1" ]] || [[ ! -d "$2" ]]; then
	echo "Need two inputs: path for the two folders to compare"
	exit 11
fi

file1="tempfile1249sdf90.csv"
# file2="joaijergsdfgd.csv"
ls -l "$1" | rev | cut -d" " -f1 | rev >> "$file1"
cnt=0;
# ls "$1"
while read line; do
	# echo "$line"
	if [[ -e "$2/$line" ]]; then
		cnt=$((cnt+1))
	fi
done < "$file1"
rm "$file1"
nf1=$(ls "$1" | wc -w)
nf2=$(ls "$2" | wc -w)
echo "Number of images in $1: $nf1"
echo "Number of images in $2: $nf2"
echo "Number of same images: $cnt"