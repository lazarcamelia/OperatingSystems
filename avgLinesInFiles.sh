#!/bin/bash

declare -i sumLines=0
declare -i numberOfFiles=0

if [[ -d $1 ]]; then
  for f in `find $1 -maxdepth 1 -type f`
  do 
	 noLines=`cat $f | wc -l`
	 numberOfFiles=`expr $numberOfFiles + 1`
	 sumLines=$((noLines + sumLines))
  done
else
    echo "The argument is not a directory"
fi

avg=$(echo "$sumLines / $numberOfFiles" | bc -l)
#echo "The avg of the no of lines is `expr $sumLines / $numberOfFiles`"
echo $avg
