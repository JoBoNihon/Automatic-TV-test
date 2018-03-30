#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

function takeScreenshot() {
    pName="Screen-$1-$i.png";
    adb shell screencap -p "/sdcard/$pName";
    adb pull "/sdcard/$pName" > "$fPath$pName";
    adb shell rm "/sdcard/$pName"; 
    mv -f "$pName" "$fPath$pName"; 
}

mode="Down"
#Test audio increasing and decreasing
for i in 0 1
do
    #Test all levels
    for i in $(seq 0 14)
    do 
        eval \$rVol$mode;
        takeScreenshot $mode;
    done
    mode="Up"
done
#Test mute
for i in 0 1 
do
    $rMute;
    takeScreenshot "Mute";
done
#Test finish