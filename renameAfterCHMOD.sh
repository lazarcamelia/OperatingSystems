#!/bin/bash

for f in `find $1 -type f -perm -ugo=w`
    do
	echo $f
	mv $f $f.all
    done
