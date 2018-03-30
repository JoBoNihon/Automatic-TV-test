#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rHandy;
sleep 3;
hMode="Big";
#Test all the sizes
for i in 0 1
do
    $rHandySize;
    sleep 2;
    #Test all positions with both sizes
    for i in $(seq 0 3)
    do 
        $rHandyPosition;    
        pName="Screen-$hMode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        sleep 2;
        adb pull "/sdcard/$pName" > "$fPath$pName";
        adb shell rm "/sdcard/$pName";  
        rm "$pName";
        mv -f "$pName" "$fPath$pName"; 
    done
    $hMode="Small";
done
#Test finish
$rHandy;
