#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

mode=25
#Test audio increasing and decreasing
for i in 0 1
do
    #Test all levels
    for i in $(seq 0 14)
    do 
        adb shell input keyevent "$mode";
    done
    mode=24
done
#Test mute
for i in 0 1 
do
    $rMute;
    sleep 3;
done
#Test finish