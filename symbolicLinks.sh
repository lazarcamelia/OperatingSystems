#!/bin/bash

for f in `find $1`; do
     if [ -L $f ] && [ ! -e $f ]; then
	    echo "$f"
     fi
done	
