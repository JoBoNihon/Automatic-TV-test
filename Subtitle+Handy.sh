#!/bin/bash
adb shell input keyevent 141;
sleep 3;
adb shell input keyevent 8;
sleep 3;
adb shell input keyevent 140;
sleep 3;
adb shell input keyevent 134;
sleep 3;
#Test all subtitles the sizes
for i in 0 1
do
    adb shell input keyevent 131;
    sleep 2;
    #Test all subtitles positions with both sizes
    for i in 0 1
    do 
        #Test all the handy sizes
        for i in 0 1
        do
            adb shell input keyevent 135;
            sleep 2;
            #Test all handy positions with both sizes
            for i in $(seq 0 3)
            do 
                adb shell input keyevent 136;    
                sleep 2;
            done
        done
        adb shell input keyevent 125;    
        sleep 2;
    done
done
#Test finish
adb shell input keyevent 134;