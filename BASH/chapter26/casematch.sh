#!/usr/bin/bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 26.6.4
# Date: Feb/2025
# Version: 0.1.0
################################################

case_stat=$(shopt -p nocasematch)
shopt -s nocasematch

case $1 in
	-c ) echo "Get option -c" ;;
	-d ) echo "Get option -d" ;;
	-f ) echo "Get option -f" ;;
	-b ) echo "Get option -b" ;;
	-s ) echo "Get option -s" ;;
	*  ) echo "Get option $1" ;;
esac

eval $case_stat

