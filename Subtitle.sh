#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rDigital;
sleep 3;
$rNum1;
sleep 3;
$rSubtitle;
sleep 3;
sMode="Big"
#Test all the sizes
for i in 0 1
do
    $rSubtitleSize;
    sleep 2;
    #Test all positions with both sizes
    for i in 0 1
    do 
        $rSubtitlePosition;    
        pName="Screen-$sMode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        sleep 2;
        adb pull "/sdcard/$pName" > "$fPath$pName";
        adb shell rm "/sdcard/$pName";  
        rm "$pName";
    done
    $sMode="Small"
done
#Test finish
$rSubtitle;