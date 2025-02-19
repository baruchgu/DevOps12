#!/usr/bin/env bash
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 25
# Date: Feb/2025
# Version: 0.1.0
################################################

[[ $# -lt 2 ]] && echo "USAGE: $(basename $0) <file> <file>" && exit 1

echo "=== 25.7.1 ==="
if [[ -r $1 ]] ; then
	echo "File 1: $1"
	cat $1
fi

if [[ -r $2 ]] ; then
	echo "File 2: $2"
	cat $2
fi

