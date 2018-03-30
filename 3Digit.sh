#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rNum1;
$rOSD;
read -p "Enter TV channel : " channel
$r3Digit;
for i in $(seq 0 2)
do
    eval \$rNum${channel:$i:1};
done
pName="Screen-Input.png";  
adb shell screencap -p "/sdcard/$pName";
adb pull "/sdcard/$pName" > "$fPath$pName";
adb shell rm "/sdcard/$pName";  
mv -f "$pName" "$fPath$pName";
for i in $(seq 0 2) 
do
    $rOSD;
done
#Test finish