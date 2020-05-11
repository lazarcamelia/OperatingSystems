#!/bin/bash

if [ $# -ne 1 ]; then
   echo "The number of params is not the one required"
   exit
fi

dir=`pwd`

declare -i isOk=0

for f in `find $dir -type f -name "*$1"`; do
     no_words=$(cat $f | wc -w | cut -d' ' -f 1)
     isOk=1
     for word in `cat $f`; do
	num=`echo $word | grep -c "^[0-9]*$"`
	if [[ $num -gt 0 ]]; then
		if [ $((word%2)) -eq 0 ] && [ $((no_words%2)) -eq 1 ]; then
		isOk=0
		break
	    fi
	fi
     done
     if [ $isOk -eq 1 ]; then
        permisions=`ls -l $f | cut -d' ' -f 1`
        permisions=`echo $permisions | sed "s/^.\(...\).*$/\1/g"`
	echo "$permisions $f"
     fi
done
