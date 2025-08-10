#!/bin/bash
len=1
delay=60

while true
do
    if [[ -z "$1" ]]
    then
        for angle in 0 90 180 270
        do
            xdotool mousemove_relative --polar $angle $len
            sleep $delay
        done
    else
        xdotool type +
        sleep $delay
    fi
done
