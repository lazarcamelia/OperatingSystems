#!/bin/bash

if [[ -d $1 ]]; then
    for f in `find $1 -type f -name "*.log"`; do
	sort $f > aux.txt
	mv aux.txt $f
    done
else
    echo "$1 is not a directory"
fi
