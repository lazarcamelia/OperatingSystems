#!/bin/bash

> auxiliar.txt
while [ $1 ]; do
    isFile=$(file $1 | grep -c "text")
    if [ $isFile -eq 1 ]; then
       size=$(du -b $1 | cut -f1)
       echo "$1 $size" >> auxiliar.txt 
    fi
shift
done

sort -t " " -k 2,2 auxiliar.txt 
