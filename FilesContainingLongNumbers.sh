#!/bin/bash

for f in `find $1 -type f`
    do
	if grep -c '\([0-9]\)\{5,\}' $f > 0
	  then
		echo $f
	fi
    done

