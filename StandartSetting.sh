#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

# repeat_key_and_ok(keycode, count)
function repeat_key_and_ok() {
    for i in $(seq 1 $2)
    do
        $1;
    done
    $rOk;
}
function setIP() {
    for i in $(seq 0 ${#ip})
    do
        if [[ ${ip:$i:1} = "." ]];
        then
            adb shell input keyevent 56;
        else
            eval \$rNum${ip:$i:1};
        fi
    done
}
function setNetMask {
    netmask="255.255.255.0";
    for i in $(seq 0 12)
    do
        if [ ${netmask:$i:1} = "." ];
        then
            adb shell input keyevent 56;
        else
            eval \$rNum${netmask:$i:1};
        fi
    done
}
function setGateway {
    gateway="192.168.0.253";
    for i in $(seq 0 12)
    do
        if [ ${gateway:$i:1} = "." ];
        then
            adb shell input keyevent 56;
        else
            eval \$rNum${gateway:$i:1};
        fi
    done

}
function setDNS {
    dns="192.168.0.185"
    for i in $(seq 0 12)
    do
        if [ ${dns:$i:1} = "." ];
        then
            adb shell input keyevent 56;
        else
            eval \$rNum${dns:$i:1};
        fi
    done
}   

$rMenu;
sleep 2;
for i in $(seq 0 4)
do
    case $i in
    0)      $rNum1;;
    1)      $rNum4;;
    2|3)    $rNum3;;
    esac
done
repeat_key_and_ok "$rDown" 3
repeat_key_and_ok "$rLeft" 2
$rDown;
read -p "IP : " ip
sleep 3;
setIP
for i in $(seq 0 7)
do
    case $i in
    0|2|4|6|7)  $rDown;;
    1)          setNetMask;;
    3)          setGateway;;
    5)          setDNS;;
    esac
done
for i in $(seq 0 2)
do
    $rOk;
    if [ $i = 0 ];
    then
        adb disconnect;
        adb connect $ip;
    fi
done
$rMenu;
#Test finish