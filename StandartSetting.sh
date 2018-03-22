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
    for i in $(seq 0 12)
    do
        if [ ${ip:$i:1} = "." ];
        then
            adb shell input keyevent 56;
        else
            cDigit="rNum${ip:$i:1}";
            ${!cDigit};
        fi
    done
}
function setNetMask {
    for i in $(seq 0 12)
    do
        case $i in
            0|4|8)          $rNum2;;
            1|2|5|6|9|10)   $rNum5;;
            3|7|11)         adb shell input keyevent 56;;
            12)             $rNum10;;
        esac
    done
}
function setGateway {
    for i in $(seq 0 12)
    do
        case $i in
            0|4)    $rNum1;;
            1)      $rNum9;;
            2|10)   $rNum2;;
            3|7|9)  adb shell input keyevent 56;;
            5)      $rNum6;;
            6)      $rNum8;;
            8)      $rNum10;;
            11)     $rNum5;;
            12)     $rNum3;;
        esac
    done

}
function setDNS {
    for i in $(seq 0 12)
    do
        case $i in
            0|4|10) $rNum1;;
            1)      $rNum9;;
            2)      $rNum2;;
            3|7|9)  adb shell input keyevent 56;;
            5)      $rNum6;;
            6|11)   $rNum8;;
            8)      $rNum10;;   
            12)     $rNum5;;
        esac
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
        adb connect $channel;
    fi
done
$rMenu;
#Test finish