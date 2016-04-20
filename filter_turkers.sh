#! /bin/bash 
# input 1: original turker acc file
# output file of the sorted acc file, sorted_acc.csv
# output file of the filtered acc file, filtered_turkers.csv
# input 2: original file containing the files 





if [[ -e "sorted_acc.csv" ]]; then
	rm "sorted_acc.csv"
fi

if [[ -e "filtered_turkers.csv" ]]; then
	rm "filtered_turkers.csv"
fi

# sort the acc file
sort -t"," -k2 -nr "$1" >> "sorted_acc.csv"
python extTurker.py "sorted_acc.csv" "filtered_turkers.csv"


#sort labels according to image name
if [[ -e "labels_sorted_on_images.csv" ]]; then
	rm "labels_sorted_on_images.csv"
fi
sort -t"," -k1 "$2" >> "labels_sorted_on_images.csv"
#remove untrusted turkers

# trustedTurkers is the trusted turkers
# IFS=","
# while read line; do
# 	trustedTurkers=($line)
# done < "filtered_turkers.csv"

# numTurkers=$((${#trustedTurkers[@]}-1))
# sortedLabel="filtered_labels.csv"
# if [[ -e "$sortedLabel" ]]; then
# 	rm "$sortedLabel"
# fi
# # for i in {0.."$numTurkers"}; do
# for i in {0..215}; do
# 	cat "labels_sorted_on_images.csv" | grep "${trustedTurkers[$i]}" >> "$sortedLabel"
# done