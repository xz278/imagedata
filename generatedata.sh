#! /bin/bash

# genarte training data
# echo "	Number of inputs: $#"




if [[ "$#" -eq 3 ]]; then
	echo "	Input labels: $1; input image folder: $2;  Store at $3/"
else
	echo "	Input need to a file name and the path to generate data"
	exit 11
fi

if [[ ! -e "$1" ]]; then
# 	echo "12"
# else
	echo "	Specified input file does not exist."
	exit 12
fi

if [[ ! -d "$2" ]]; then
	echo "	Input image folder does not exist."
	exit 13
fi

imageFolder="$2"

path="$3"\/

if [[ ! -d "$path" ]]; then
	mkdir "$path"
fi

while read line; do
	# for each line
	imageName=$(echo "$line" | cut -d , -f 1)
	# echo "	Image name: $imageName"
	# echo $line
	types=$(echo "$line" | cut -d , -f 3)
	# echo "${types[*]}"
	arr=($types)
	numOfLabels=$((${#arr[@]}))
	# echo "$numOfLabels"
	if [[ "$numOfLabels" -gt 0 ]]; then
		# echo "$numOfLabels"
		for t in "${arr[@]}"; do
			if [[ "$t" != *"-"* ]]; then
				# echo "		$t"
				l=$(echo $t | tr '[A-Z]' '[a-z]')
				# echo "		$l"
				dest="$path$l"
				# echo "$dest"
				if [[ ! -e "$dest" ]]; then
					mkdir "$dest"
				fi
				cp "$imageFolder$imageName" "$dest"
			fi
		done
	fi
done < "$1"


