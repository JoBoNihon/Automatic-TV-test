#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rNum1;
$rOSD;
sleep 5;
mode="Up"
#Test all channels increasing and decreasing
for i in 0 1
do
    #Test all channels
    for i in $(seq 0 11)
    do 
        eval \$rChannel$mode; 
        pName="Screen-$mode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        sleep 5;
        adb pull "/sdcard/$pName" > "$fPath$pName"
        adb shell rm "/sdcard/$pName";         
    done
    mode="Down"
done
#Test finish
for i in $(seq 0 2) 
do
    $rOSD;
done