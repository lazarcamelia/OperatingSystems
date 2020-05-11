#!/bin/bash

users=`who | cut -d' ' -f1 | sort | uniq`

while read user; do
     echo $user
     no_processes=`ps -u $user | wc -l`
     echo $no_processes
done <<< $users

