#!/bin/bash
adb shell input keyevent 134;
sleep 3;
#Test all the sizes
for i in 0 1
do
    adb shell input keyevent 135;
    sleep 2;
    #Test all positions with both sizes
    for i in $(seq 0 3)
    do 
        adb shell input keyevent 136;    
        sleep 2;
    done
done
#Test finish
adb shell input keyevent 134;
