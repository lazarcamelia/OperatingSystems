#!/bin/bash

declare -i sum=0

if [[ -d $1 ]]; then
   for f in `find $1 -maxdepth 1 -type f`; do
	isFile=`file "$f" | grep -c "text"`
	if [ $isFile -eq 1 ]; then
	   nr=$(du -b "$f" | cut -f1)
	   sum=$((nr+sum))
	fi
   done
else
   echo "The argument is not a directory"
fi

echo "The total size is $sum"
