#!/bin/bash

while [[ $1 ]]; do
    if [[ -f $1 ]]; then
        echo `wc -w < $1` >> $1.info 
    elif [[ -d $1 ]]; then
	echo `ls $1 | wc -l` >> $1.info 
    else
	echo $1 > error-report.txt 
    fi
    shift
done
