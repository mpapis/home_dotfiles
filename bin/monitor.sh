#!/usr/bin/env bash

top -b -n 1 -o +%CPU -o +%MEM |
sed -n '8,11 p' |
while read pid user pr ni virt res shr s cpu mem time command
do
  if
    [[ "$(bc<<<"$cpu<90")" == "0" ]] ||
    [[ "$(bc<<<"$cpu<40")" == "0" && "firefox" != "$command" ]]
  then
    echo $pid $user $s $cpu $mem $command
  fi
done
