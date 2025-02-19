#!/usr/bin/bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 26.6.1
# Date: Feb/2025
# Version: 0.1.0
################################################

set -e

function check_num(){
    [[ $1 -lt 1 || $1 -gt 100 ]]
    echo $(( ! $? ))
}

echo "HW: ==== 26.6.1-3 ===="


echo -n "Enter a number: "       ; read -r num1
echo -n "Enter another number: " ; read -r num2

[[ "$(check_num $num1)" -ne 0 ]] && echo "$num1 Out of 1-100 range" && exit 1
[[ "$(check_num $num2)" -ne 0 ]] && echo "$num2 Out of 1-100 range" && exit 1


echo -e "\
Sum:\t\t $num1 + $num2 = $(( $num1 + $num2 ))
Product:\t $num1 + $num2 = $(( $num1 * $num2 ))"

[[ $(( $num1 + $num2 )) -eq $(( $num1 * $num2 )) ]] && echo "Congrats, dear!"
