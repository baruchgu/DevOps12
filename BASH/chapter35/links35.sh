#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 35 - file links
# Date: Feb/2025
# Version: 0.1.0
################################################

# task 1
ls -lt | tee winter.txt > summer.txt

# task 2
ln winter.txt hwwinter.txt

# task 3
ls -li winter.txt hwwinter.txt
 
# task 4
find . -inum $(ls -i winter.txt | cit -f1 -d ' ') 2> /dev/null
echo "There are two files"


# task 5
echo "The file name and its content is not saved in inode"

# task 6
ln -s summer.txt slsummer.txt

# task 7
find . -inum $(ls -i slsummer.txt | cut -f1 -d ' ') 2> /dev/null
echo "There is one file"

# task 8
echo "There are symbolic links in /etc/rc2.d dir"

# task 9
echo "/lib is a symbolic link to /usr/lib"

# task 10
find $HOME -type f ! -links 1 
