#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rDigital;
$rNum1;
$rSubtitle;
$rHandy;
sSize="Small";
#Test all subtitles the sizes
for i in 0 1
do
    $rSubtitleSize;
    sPosition="Bottom";
    #Test all subtitles positions with both sizes
    for i in 0 1
    do 
        hSize="Small";
        #Test all the handy sizes
        for i in 0 1
        do
            $rHandySize;
            #Test all handy positions with both sizes
            for i in $(seq 0 3)
            do 
                $rHandyPosition; 
                pName="Screen-$sSize-$sPosition-$hSize-$i.png";  
                adb shell screencap -p "/sdcard/$pName";
                adb pull "/sdcard/$pName" > "$fPath$pName";
                adb shell rm "/sdcard/$pName";  
                mv -f "$pName" "$fPath$pName"; 
            done
            $hSize="Big";
        done
        $rSubtitlePosition;
        $sPosition="Up";    
    done
    $sSize="Big";
done
#Test finish
$rHandy;