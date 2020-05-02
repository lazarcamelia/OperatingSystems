#!/bin/bash

declare -i a=0
declare -i b=0
declare -i newSum=0
>raportlinii.txt
while read extension; do
    echo "$extension 0" >> raportlinii.txt
done < extentions.txt

while [[ $1 ]]; do
     if [[ -d $1 ]]; then
	 while read extension
	 do
		a=$(find $1 -type f -name "*.$extension" | wc -l)
		b=$(cat raportlinii.txt | grep "$extension"| cut -d" " -f2)
		newSum=`expr $a + $b`
		echo "a este $a"
		echo "b este $b"
		sed -ie "s/\($extension\) [0-9]*/\1 $newSum/g" raportlinii.txt
	 done < extentions.txt
     else
	echo "$1 is not a directory"
     fi
     shift
done

