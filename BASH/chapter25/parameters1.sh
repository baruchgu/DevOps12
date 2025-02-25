#!/usr/bin/env bash
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 25
# Date: Feb/2025
# Version: 0.1.0
################################################

[[ $# -lt 4 ]] && echo "USAGE: $(basename $0) <arg> <arg> <arg> <arg>" && exit 1 

echo "=== 25.7.1 ===" # it is prefered to use dynamic values when it comes to dates: $(date +%Y.%m.%d) would be betterr
echo "Reversed ordered parameters: $4 $3 $2 $1"


