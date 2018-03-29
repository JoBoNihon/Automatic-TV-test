#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

mode="Down"
#Test audio increasing and decreasing
for i in 0 1
do
    #Test all levels
    for i in $(seq 0 14)
    do 
        eval \$rVol$mode;
        pName="Screen-$mode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        sleep 1;
        adb pull "/sdcard/$pName" > "$fPath$pName";
        adb shell rm "/sdcard/$pName";  
        rm "$pName";
    done
    mode="Up"
done
#Test mute
for i in 0 1 
do
    $rMute;
    sleep 3;
done
#Test finish