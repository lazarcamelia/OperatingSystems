#!/bin/bash

declare -i count=0

if [[ -d $1 ]]; then
    for f in `find $1 -type f -name "*.c"`; do
	lines=`cat $f | wc -l`
	if [ $lines -gt 500 ]; then
	   echo "$f"
	   count=`expr $count + 1`
	fi
	if [ $count -eq 2 ]; then
	   break
	fi
    done
else
   echo "This is not a directory"
fi
