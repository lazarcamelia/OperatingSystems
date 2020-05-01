#!/bin/bash

for f in `find $1 -type f | sort`
    do
        if file $f | grep -q "ASCII text"
	   then
	     echo -n "File: "; echo $f | sed 's@.*/@@'
	     len=`cat $f | wc -l`

	     if [ $len -lt 10 ]
		then
		    cat -n $f
		 else
	            echo "____Head____"
		    head -n 5 $f
		    echo "____Tail____"
		    tail -n 5 $f
             fi
        fi
   done
