#!/bin/bash
light_red='\e[1;91m%s\e[0m\n'
light_green='\e[1;92m%s\e[0m\n'
ping -c 4 -q $1
if [ "$?" -eq 0 ]; then
  printf "$light_green" "[ CONNECTION AVAILABLE ]"
else
  printf "$light_red" "[ HOST DISCONNECTED ]"
fi
