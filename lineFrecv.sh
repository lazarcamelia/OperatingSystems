#!/bin/bash

while [[ $1 ]]; do
	>fisier.txt
	>fis.txt
	cat "$1" > fisier.txt
	uniq -c fisier.txt | sort -t " " -k 1,1 -r > fis.txt
	while read line; do
	   echo "$line"
	   break
	done < fis.txt
shift
done
