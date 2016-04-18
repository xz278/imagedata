# test associate arrays
declare -A arr
arr["a"]="abcdefg"
# arr["x"]="11111"

# echo "${arr["a"]}"
# echo "${arr["x"]}"
# echo "${arr["zzz"]}"
if test "${arr["a"]+isset}"; then
	echo "a is set, its value is ${arr["a"]}"
else
	echo "a is not set"
fi


if test "${arr["c"]+isset}"; then
	echo "c is set, its value is ${arr["c"]}"
else
	echo "c is not set"
fi
