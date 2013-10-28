#!/bin/bash

ls -lhF $1 | while read DATA
do
  case "${DATA:0:1}" in
  "-"|"d")
    PERM=$( echo "${DATA:1:9}" | sed 's/-/0/g;s/r/4/g;s/w/2/g;s/x/1/g' )
    P_US=$((${PERM:0:1}+${PERM:1:1}+${PERM:2:1}))
    P_GR=$((${PERM:3:1}+${PERM:4:1}+${PERM:5:1}))
    P_OT=$((${PERM:6:1}+${PERM:7:1}+${PERM:8:1}))
    DATA=$( echo "$DATA" | sed "s/${DATA:0:10}/${P_US}${P_GR}${P_OT}/" )
    echo "$DATA"
  ;;
  *)
    continue
  ;;
  esac
done

exit 0
#finis
