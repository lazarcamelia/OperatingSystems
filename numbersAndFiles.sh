#!/bin/bash

declare -i suma=0
declare -i noOfWords=0

number='^[0-9]+$'
if ! [[ $1 ]]; then
  echo "No parameters"
fi
while [ $1 ]; do
    if [[ -f $1 ]]; then
	noOfWords=$noOfWords+`wc -w < $1`
    elif [[ -d $1 ]]; then
        echo "$1 is a directory, not a file or a number"
    else [[ $number  =~ $1 ]]
	suma=$1+$suma;
    fi
    shift
done
> raport.txt
echo "The sum is = $suma"
`echo "Number of words is = $noOfWords" >> raport.txt`
