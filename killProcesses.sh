#!/bin/bash

while true; do
    for f in $@; do
       processes_pids=`ps -u $f | awk -F' ' 'NR>1{print $1}'`
       while read process; do
	   kill $process
       done <<< $processes_pids
    done
done
