#!/bin/bash

> filenames.txt
if [ -d $1 ]; then
	for f in `find $1 -type f`; do
	echo $f | rev | cut -d"/" -f 1 | rev >> filenames.txt
	done		
else
    echo "$1 is not a directory"
fi

cat filenames.txt | sort | uniq -c
