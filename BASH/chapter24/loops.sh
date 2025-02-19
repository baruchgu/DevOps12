#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 24
# Date: Feb/2025
# Version: 0.1.0
################################################

echo -e "\t\tLoop 1"
for i in {3..7} ; do
	echo "i=$i"
done

echo -e "\t\tLoop 2"
for (( i=1; i<=17000; i++ )); do
	true
done
echo i=$i

echo -e "\t\tLoop 3"
i=3
echo "i=$i"
while (($i <= 7)); do
	((i++))
done
echo "i=$i"

if [[ $(ls | grep -c .txt) > 0 ]] ; then
    echo "File with .txt syffix: $(ls -l *.txt | wc -l)"
fi

