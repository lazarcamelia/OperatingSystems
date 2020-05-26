#!/bin/bash

for f in `find $1 -perm 755`; do
   chmod 744 $f 
done

