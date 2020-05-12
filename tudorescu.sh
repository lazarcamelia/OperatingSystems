#!/bin/bash

declare -i nrfiles=0 
declare -i sizeFiles=0
declare -i nrDir=0
declare -i permisiune=0
declare -i nrlog=0
> perm.txt
> nr.txt
while [[ $1 ]]; do
     if [ -f $1 ]; then
	nrfiles=$((nrfiles+1))
        sizeFile=`ls -l $1 | awk -F' ' '{print $5}'`
	sizeFiles=$((sizeFile+sizeFiles))
     elif [ -d $1 ]; then
        nrDir=$((nrDir+1))
	if [ -x $1 ]; then
	 echo $1 > perm.txt 
	fi
     elif [[ $1 =~ ^[0-9]+$ ]];then
	 echo $1 > nr.txt
     else 
	nrlogari=`cat last.fake | grep -c "Fri"`
        nrLog=$((nrLog+nrlogari))
     fi	
shift
done

echo "The nr of files is $nrfiles and size is $sizeFiles"
echo "The nr of directories is $nrDir"
cat perm.txt
cat nr.txt | sort -r > nr2.txt
cat nr2.txt
