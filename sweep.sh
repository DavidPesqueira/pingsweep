#!/bin/bash

RED="\e[31m"
LGREEN="\e[92m"
ENDCOLOR="\e[0m"

echo -e "${RED} Please enter Network portion of an IP. Example 10.10.10 ${ENDCOLOR}"
read ip
echo -e "${RED} You entered $ip ${ENDCOLOR}"
echo -e "${LGREEN}Scanning $ip.0/24 now ${ENDCOLOR}"
for i in {1..254} ;do (ping -c 1 $ip.$i | grep --color=always "bytes from" | cut -d " " -f4 | tr -d ':' &) ;done
