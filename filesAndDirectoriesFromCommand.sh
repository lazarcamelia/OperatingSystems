#!/bin/bash

if ! [[ $1 ]]; then
   echo "Not enough params"
else 
   while [[ $1 ]]; do
       if [[ -f $1 ]]; then
	   noLines=`cat $1 | wc -l`
	   noChars=`cat $1 | wc -m`
	   echo "$1 $noLines $noChars"
       elif [[ -d $1 ]]; then
	   noFiles=`find $1 -type f | wc -l`
	   echo "$1 $noFiles"
       fi 
   shift
   done
fi
