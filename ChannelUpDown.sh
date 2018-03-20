#!/bin/bash
adb shell input keyevent 8;
adb shell input keyevent 165;
sleep 5;
mode=92
#Test all channels increasing and decreasing
for i in 0 1
do
    #Test all channels
    for i in $(seq 0 11)
    do 
        adb shell input keyevent "$mode";    
        sleep 5;       
    done
    mode=93
done
#Test finish
for i in $(seq 0 2) 
do
    adb shell input keyevent 165;
done