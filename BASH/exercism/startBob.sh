#!/usr/bin/bash

[[ $1 == *[[:lower:]]*   ]] ; flag_low=$((! $?))
[[ $1 == *[[:upper:]]*   ]] ; flag_upp=$((! $?))
[[ $1 == *[[:digit:]]*   ]] ; flag_dig=$((! $?))
[[ $1 =~ \?[[:space:]]*$ ]] ; flag_qst=$((! $?))

res=$flag_qst$flag_dig$flag_upp$flag_low
echo $1 == $res
case $res in
    1*10 ) echo "Calm down, I know what I'm doing!" ;;
    **10 ) echo "Whoa, chill out!" ;;
    1*** ) echo "Sure." ;;
    0000 ) echo "Fine. Be that way!" ;;
    *    ) echo "Whatever." ;;
esac
exit

in=$(echo "$1"| tr -d "'()0-9-+=,;:!")

regexp='^[A-Z [:punct:]]+\?$'
[[ "$1n" =~ $regexp ]] && echo "Calm down, I know what I'm doing!" && exit 0

regexp='^[A-Z [:punct:]]+$'
[[ "$in" =~ $regexp ]] && echo "Whoa, chill out!" && exit 0

regexp='\?$'
[[ "$in" =~ $regexp ]] && echo "Sure." && exit 0

regexp='^ *$'
[[ "$in" =~ $regexp ]] && echo "Fine. Be that way!" && exit 0

echo "Whatever." 
