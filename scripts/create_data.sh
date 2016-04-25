#!/bin/bash
# input 1: turker accuracy
# input 2: original labels file
# input 3: image folder
# create labels
# new data folder is: new_data/

if [[ "$#" -ne 3 ]]; then
	echo "input 1: turker accuracy file"
	echo "input 2: original labels file"
	echo "input 3: image folder"
	exit 11
fi


# sort the acc file
sort -t"," -k2 -nr "$1" >> "sorted_acc.csv"

sort -t"," -k1 "turker_with_food_tokens.csv" > "original_label_sorted.csv"

python filterLabel.py "sorted_acc.csv" "original_label_sorted.csv"  # generate new labels



./sort_data.sh "new_label.csv" "$3"

./analyze.sh "new_data/" "new_stats.csv"

sort -t"," -k2 -nr "new_stats.csv" >> "sorted_new_stats.csv"

./cleardata.sh "new_data/" "new_stats_sorted.csv" "new_data_removed/" 10

./copyTop10.sh "sorted_new_stats.csv" "new_data/" 