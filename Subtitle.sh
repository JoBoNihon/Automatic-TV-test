#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rDigital;
$rNum1;
$rSubtitle;
sMode="Small"
#Test all the sizes
for i in 0 1
do
    $rSubtitleSize;
    #Test all positions with both sizes
    for i in 0 1
    do 
        $rSubtitlePosition;    
        pName="Screen-$sMode-$i.png";  
        adb shell screencap -p "/sdcard/$pName";
        adb pull "/sdcard/$pName" > "$fPath$pName";
        adb shell rm "/sdcard/$pName";  
        mv -f "$pName" "$fPath$pName"; 
    done
    $sMode="Big"
done
#Test finish
$rSubtitle;