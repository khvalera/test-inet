#!/bin/bash
IP=$1
st=0
path_log=$2
cycle=$3

if ! [ ${IP} ]; then
 IP=8.8.8.8
fi

if ! [ ${cycle} ]; then
 cycle=0
fi

cycle_ping() {
  res=1
  /bin/ping ${IP} -c 2 > /dev/null 2>&1 && res=0
  datal=`date +%Y%m%d`
  datat=`date +%T`
  if [ ${res} -eq 0 ]; then
    if [ ${st} = 0 ]; then
       if [ ${path_log} ]; then
         echo "${datat} - internet yes" 2>&1 | tee -a ${path_log}"/test-ip-${datal}-${IP}.log"
       else
         echo "${datat} - internet yes"
       fi
       st=1
    fi
  else
    if [ ${st} = 1 ]; then
      if [ ${path_log} ]; then
        echo "${datat} - internet no" 2>&1 | tee -a ${path_log}"/test-ip-${datal}-${IP}.log"
      else
        echo "${datat} - internet no"
      fi
      st=0
    fi
  fi
  sleep 2
}

if [ ${cycle} = 1 ]; then
  while true; do
    cycle_ping
  done
else
   cycle_ping
fi
