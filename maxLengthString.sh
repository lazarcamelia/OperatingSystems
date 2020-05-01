#!/bin/bash

declare -i maxim=0
maximString=""

while [ $1 ]; 
do
    length=`echo -n $1 | wc -m`
    if [ $length -gt $maxim ]; 
	then
	maxim=$length
	maximString=$1
    fi
    shift
done
echo "String-ul maxim e: $maximString"
