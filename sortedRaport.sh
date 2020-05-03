#!/bin/bash

>raport.txt
while [[ $1 ]]; do
   if [[ -d $1 ]]; then
	nrFiles=$(find $1 -maxdepth 1 -type f | wc -l)
	nrDirectories=$(find $1 -maxdepth 1 -type d | wc -l)
	nrDirectories=`expr $nrDirectories - 1`
	echo "$nrFiles/$nrDirectories - $1" >> raport.txt
   else
      echo "$1 is not a directory"
   fi
   shift
done

sort -t " " -k 3,3 raport.txt > aux.txt
mv aux.txt raport.txt
