#!/bin/bash
#
# Config was made by Necromant
# shell scipt to prepend i3status with more stuff

i3status -c ~/.i3/i3status.conf | while :
do
        read line
        LG=$( exec xkblayout-state print "%s" ) 
        KEY=$( exec xset -q | grep Num )
        CAPS=$( echo ${KEY} | awk '{print $4}' )
        NUM=$( echo ${KEY} | awk '{print $8}' )
        SCROLL=$( echo ${KEY} | awk '{print $12}')
        VIDEO=$( exec sensors | grep temp1 )
        VIDEOTEMP=$( echo ${VIDEO} | awk '{print $2}' )
        CPU=$( exec sensors | grep Physical )
        CPUTEMP=$( echo ${CPU} | awk '{print $4}' )
        MEM=$( exec free | grep Mem )
        let MEMTOTAL=$(echo ${MEM} | awk '{print $2}')/1024
        let MEMUSED=$(echo ${MEM} | awk '{print $3}')/1024
        let MEMFREE=$(echo ${MEM} | awk '{print $4}')/1024
        let MEMAVABLE=$(echo ${MEM} | awk '{print $7}')/1024
        ln="$line &#xf11c; $( exec xkblayout-state print "%s" ) " # 11c keyboard
        echo ${ln//|/  } || exit 1
done