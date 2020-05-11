#!/bin/bash

while [[ $1 ]]; do
   if [[ $1 =~ "stop" ]]; then
	  break
   fi

   isFile=$(file "$1" | grep -c "text")
   if [ $isFile -eq 1 ]; then
       while read linie; do
	   noCuv=$(echo "$linie" | wc -w)
	   echo "The number of words from the first line in $1 is $noCuv"
	   break
       done < $1
   fi
shift
done
