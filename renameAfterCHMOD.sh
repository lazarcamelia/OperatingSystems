#!/bin/bash

for f in `find $1 -type f -perm -ugo=w`
    do
	echo $f
	mv $f $f.all
    done
#give permisions to all: +x / +r / +w
#give permisions only to a few: g-w / u+rx
