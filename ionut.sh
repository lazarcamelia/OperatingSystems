#!/bin/bash

> raport.txt
while [ $1 ]; do
    for f in `find $1 -maxdepth 1 -type f -perm -ugo=x`; do
	 if [ -x $f ]; then
	    size=`ls -l $f | awk -F' ' '{print $5}'`
	    echo "$f $size" >> raport.txt
	 fi
    done
shift
done
