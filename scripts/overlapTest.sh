#! /bin/bash 

# get top 10 categories
top10=$(head -10 "sorted_new_stats.csv" | cut -d"," -f1 | tr '\n' ' ')
# echo "$top10"
arr=($top10)
# echo "${arr[@]}"
output="mt.txt"
if [[ -e $output ]]; then
	rm $output
fi
printf "title" >> $output
sp=" "
nl="\n"
for (( i = 0; i < 10; i++ )); do
	printf "$sp" >> $output
	printf "${arr[i]}" >> $output
done
printf "\n" >> $output
for (( i = 0; i < 10; i++ )); do
	printf "${arr[i]}" >> $output
	for (( j = 0; j < 10; j++ )); do
		printf "$sp" >> $output
		printf $(./testOverlap.sh "new_data/"${arr[i]} "new_data/"${arr[j]}) >> $output
	done
	printf "\n" >> $output
done

python writeToFile.py "$output" "overlap_stats.txt"

rm $output