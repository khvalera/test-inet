#!/bin/bash
IP=$1
st=0
logfile=$2
if ! [ ${IP} ]; then
 IP=8.8.8.8
fi
while true; do
  res=1
  /bin/ping ${IP} -c 2 > /dev/null 2>&1 && res=0
  datal=`date +%Y%m%d`
  if ! [ ${logfile} ]; then
    logfile="/var/log/test-ip-${datal}-${IP}.log"
  fi
  datat=`date +%T`
  if [ ${res} -eq 0 ]; then
    if [ ${st} = 0 ]; then
      echo "${datat} - internet yes" 2>&1 | tee -a ${logfile}
      st=1
    fi
  else
    if [ ${st} = 1 ]; then
      echo "${datat} - internet no" 2>&1 | tee -a ${logfile}
      st=0
    fi
  fi
  sleep 2
done
