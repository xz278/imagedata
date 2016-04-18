#! /bin/bash
# remove categories that have images less than five
# input $1: data folder
# input $2: sorted/unsorted data stats
# input $3: folder used to store deleted category images
# input $4: the threshold number

if [[ "$#" -ne 4 ]]; then
	echo "Need four inputs."
	exit 11
fi

if [[ ! -e "$1" ]] || [[ ! -d "$1" ]]; then
	echo "Invalid data folder."
	exit 12
fi

echo "Executing..."
if [[ -e "$3" ]] || [[ -d "$3" ]]; then
	rm -r "$3"
fi
mkdir "$3"
IFS=","
while read line; do
	arr=($line)
	if [[ "${arr[1]}" -lt "$4" ]]; then
		mv "$1${arr[0]}" "./$3/${arr[0]}"
	fi
done < "$2"

echo "Done."