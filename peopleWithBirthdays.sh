#!/bin/bash

>names.txt
currentDate=`date +"%d/%m"`

if ! [ $1 ]; then
  echo "Not enough params"
fi

while [[ $1 ]]; do
     if [[ -f $1 ]]; then
	 while read line; do
	     dateOfBirth=$(echo $line | awk 'BEGIN { FS = "-" }; { print $1 }')
	     dayAndMonth=$(echo $dateOfBirth | awk 'BEGIN {FS = "/"}; { print $1"/"$2 }')
	     name=$(echo $line | awk 'BEGIN { FS = "-" }; { print $2 }')
	     if [ $currentDate = $dayAndMonth ]; then
		echo $name >> names.txt
	     fi
         done < $1
     else
	 echo "$1 is not a directory"
     fi
shift
done
