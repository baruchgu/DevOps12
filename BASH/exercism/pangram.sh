#!/usr/bin/env bash
set -x
in="$*"
count=$(echo -n ${*,,} | grep -o '[a-z]' | sort -u | wc -l)
[[ $count == 26 ]] &&  echo true || echo false
