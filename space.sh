df -H | awk 'NR>1{print $1}'

find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD
