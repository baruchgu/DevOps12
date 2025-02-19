#!/usr/bin/env bash
#
#
#
set -o errtrace
set -o errexit

color_to_value() {
    case $1 in
	    "black") echo 0 ;;
	    "brown") echo 1 ;;
	    "red") echo 2 ;;
	    "orange") echo 3 ;;
	    "yellow") echo 4 ;;
	    "green") echo 5 ;;
	    "blue") echo 6 ;;
	    "violet") echo 7 ;;
	    "grey") echo 8 ;;
	    "white") echo 9 ;;
	    *) exit 1 ;;
    esac
}

allzeros="0000000000"
val1=$(color_to_value $1) || (echo "Wrong color" && exit 1)
val2=$(color_to_value $2) || (echo "Wrong color" && exit 1)
val3=$(color_to_value $3) || (echo "Wrong color" && exit 1)

#[[ $val && $val2 && $val3 ]] || (echo "Wrong color" && exit 1)
#echo "$(color_to_value $1)$(color_to_value $2)${allzeros:1:$(color_to_value $3)}" ohms | sed 's/000000000 / giga/;s/000000 / mega/;s/000 / kilo/;s/^00/0/'
echo "$val1$val2${allzeros:1:$val3}" ohms | sed 's/000000000 / giga/;s/000000 / mega/;s/000 / kilo/;s/^00/0/'
