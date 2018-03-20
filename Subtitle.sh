#!/bin/bash
adb shell input keyevent 141;
sleep 3;
adb shell input keyevent 8;
sleep 3;
adb shell input keyevent 140;
sleep 3;
#Test all the sizes
for i in 0 1
do
    adb shell input keyevent 131;
    sleep 2;
    #Test all positions with both sizes
    for i in 0 1
    do 
        adb shell input keyevent 125;    
        sleep 2;
    done
done
#Test finish
adb shell input keyevent 140;