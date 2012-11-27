#!/bin/bash
IP=$1
res=1
if [ $IP ]; then
  /bin/ping $IP -c 1 > /dev/null 2>&1 && res=0
  if [ $res -eq 0 ]; then
     echo "Internet Yes"
  else
     echo "Internet No"
  fi
else
  echo "Not specified IP"
fi
