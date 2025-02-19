#!/usr/bin/env bash
#
#
#
#
set -x
in="$*"
numbers=$(echo "$in" | tr '[:lower:]' '[:upper:]' | sed 's/[AEIOULNRST]/ 1/g;s/[DG]/ 2/g;s/[BCMP]/ 3/g;s/[FHVWY]/ 4/g;s/K/ 5/g;s/[JX]/ 8/g;s/[QZ]/ 10/g')
for num in $numbers; do
	((sum+=$num))
done
echo ${sum:-0}
