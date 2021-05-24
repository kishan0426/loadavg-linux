#!/bin/bash


#load average per 30 seconds 

while true
  do
   date
   top -b -n 1 |awk '/load average/ {printf "5m - %s 10m - %s 15m - %s\n",$10,$11,$12}'
  sleep 30
done > ldavg


#delete old lines greater than 7 days

if [ `grep 'IST' ldavg |wc -l` -gt 20160 ]
  then
    sed -i '1,100d' ldavg
  else
    break
fi