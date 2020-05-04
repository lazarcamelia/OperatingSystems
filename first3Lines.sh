#!/bin/bash

if [[ -d $1 ]]; then
  for f in `find $1 -maxdepth 1 -type f`
  do 
	 head -n 5 $f
  done
else
    echo "The argument is not a directory"
fi
