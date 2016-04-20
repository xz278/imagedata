# /bin/bash
# get the statistics from the genearted data to a csv file
if [[ "$#" -ne 2 ]]; then
	echo "		Please specify the data folder and output csv file name."
	exit 11
fi

if [[ ! -d "$1" ]]; then
	echo "		Invalid data folder path. "
	exit 12
fi

if [[ -e "$2" ]]; then
	echo "		Output csv file name exists. "
	rm "$2"
	echo "		Old file removed"
fi


numCategory=$(ls -l "$1" | wc -l)
numCategory=$(($numCategory-1))
echo "		Number of category: $numCategory."
echo "		Generating category list ... "
categories=$(ls -l "$1" | rev | cut -d " " -f 1 | rev )
if [[ -e "categories.csv" ]]; then
	rm "categories.csv"
fi
echo "$categories" >> "categories.csv"


# navigate to the category folder
# cd "$1"
# create an associate array to store the frequency
# of each category
# declare -A stats

while read line; do
	# if the path exists and is a folder
	if [[ -d "$1$line" ]]; then
		count="$(ls "$1$line" | wc -w)"
		# stats["$line"]="$count"
		echo "$line,$count" >> "$2"
	fi
done < "categories.csv"




rm "categories.csv"

echo "		Completed."
