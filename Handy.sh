#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rHandy;
hMode="Small";
#Test all the sizes
for i in 0 1
do
    $rHandySize;
    #Test all positions with both sizes
    for i in $(seq 0 3)
    do 
        $rHandyPosition;    
        pName="Screen-$hMode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        adb pull "/sdcard/$pName" > "$fPath$pName";
        adb shell rm "/sdcard/$pName";  
        mv -f "$pName" "$fPath$pName"; 
    done
    $hMode="Big";
done
#Test finish
$rHandy;
