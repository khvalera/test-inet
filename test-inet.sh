#!/bin/bash
IP=$1
st=0
path_log=$2
loop=$3

if ! [ ${IP} ]; then
 IP=8.8.8.8
fi

if ! [ ${loop} ]; then
 loop=0
fi

start_help() {
  echo "Script to verify access to the Internet.

Usage: test-inet.sh [IP] [path_log] [use_a_loop]

IP         - Destination IP
path_log   - The path to save the log (optional parameter).
use_a_loop - Execute in a loop = 1 (optional parameter)"
}

start_ping() {
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

if [ ${IP} = "--help" ]; then
  start_help
  exit
fi

if [ ${loop} = 1 ]; then
  while true; do
    start_ping
  done
else
   start_ping
fi
