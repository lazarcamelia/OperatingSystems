#!/bin/bash

>raport.txt
while [[ $1 ]]; do 
    if [[ -d $1 ]]; then
       for f in `find $1 -maxdepth 1 -type f -name "*.c"`; do
	  >auxiliar.txt
	 for library in `cat $f | grep "#include"`; do
	     echo $library
	     a=$(cat raport.txt | grep "$library" | wc -l)
	     if [[ $a -lt 1 ]]; then
		echo "$library" >> raport.txt
	     fi
	  done
       done
    else
	echo "$1 is not a directory"
    fi
    shift
done
