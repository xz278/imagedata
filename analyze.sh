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
	rm -r "$2"
	echo "		Old file removed"
fi


numCategory=$(ls -l "$1" | wc -l)
numCategory=$(($numCategory-1))
echo "		Number of category: $numCategory."
echo "		Generating category list ... "
categories=$(ls -l "$1" | rev | cut -d " " -f 1 | rev )
echo "$categories" >> "categories.csv"


cd "$1"

declare -A stats


while read line; do
	if [[ -d "$line" ]]; then
		#statements
	fi
done < "$categories.csv"





rm "categories.csv"

echo "		Completed."
