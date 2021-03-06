#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

# repeat_key_and_ok(function, count)
function repeat_key_and_ok() {
    for i in $(seq 1 $2)
    do
        $1;
    done
    $rOk;
}
function takeScreenshot() {
    pName="Screen-$i.png";
    adb shell screencap -p "/sdcard/$pName";
    adb pull "/sdcard/$pName" > "$fPath$pName";
    adb shell rm "/sdcard/$pName"; 
    mv -f "$pName" "$fPath$pName"; 
}

$rMenu;
for i in $(seq 0 4)
do
    case $i in
    0)  $rNum1;;
    1)  $rNum4;;
    2|3)  $rNum3;;
    esac
done
for i in $(seq 0 8)
do 
    case $i in
        0|4)    if [ $i = 0 ];
                then
                    repeat_key_and_ok "$rDown" 8
                else
                    repeat_key_and_ok "$rDown" 7
                fi;;    
        1|2|5)  if [ $i = 5 ];
                then
                    repeat_key_and_ok "$rLeft" 1  
                else
                    repeat_key_and_ok "$rLeft" 1
                    takeScreenshot;
                fi;;
        3|7)      if [ $i = 3 ];
                then    
                    repeat_key_and_ok "$rRitgh" 2
                else
                    repeat_key_and_ok "$rRitgh" 1
                    takeScreenshot;
                fi;;
        6|8)    if [ $i = 8 ];
                then
                    repeat_key_and_ok "$rUp" 1
                    takeScreenshot; 
                else
                    repeat_key_and_ok "$rUp" 1
                fi;;
    esac
done
$rMenu;
#Test finish