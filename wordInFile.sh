#!/bin/bash

while [ $1 ] && [ $2 ]; do
    nrApp=$(cat $1 | grep -o $2 | grep -c $2)
    if [ $nrApp -gt 2 ]; then
       echo "The word $2 appears $nrApp times in $1"
    fi
shift 2
done
