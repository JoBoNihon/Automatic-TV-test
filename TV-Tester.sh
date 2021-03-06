#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh
function tFinish() {
    for i in $(seq 0 3)
    do
        case $i in
            0)      echo -n "Exiting ";;
            1|2)    echo -n ".";;
            3)      echo ".";;
        esac
        sleep 1;
    done
    exit;
}

function createFolder() {
    if [[ ! -d "$1" ]];
    then 
        mkdir "$1";  
    else
        echo "There are already test results from today."
        read -p "Do you want to delete old records? : " fDelete
        if [ ${fDelete^^} = "YES" ];
        then
            rm -rf "$1";
            mkdir "$1";
        else
            if [ ${fDelete^^} = "NO" ];
            then
                read -p "Do you want rename it?" fRename
                if [ ${fRename^^} = "YES" ];
                then
                    read -p "Input there the folder name you wish :" fName
                    mkdir "$fName"
                    fPath="$fName/";
                else
                    echo "Wait until tomorrow to test again";
                    tFinish;
                fi
            else
                echo "Input is not correct";
                tFinish;
            fi
        fi
    fi
}

function runTest() {  
    clear;
    echo $1" test";
    fPath="$fPath$1/";
    createFolder "$fPath";
    export fPath;
    case $1 in
        "First boot software")              ;;
        "Boot after setting hardware")      ;;
        "SW stand by")                      $rOnOff;;
        "Boot after setting software")      for i in $(seq 0 1)
                                            do
                                                $rOnOff;
                                            done
                                            sleep 60
                                            adb connect 192.168.0.$ip;;
        "Terrestrial digital")              $rDigital;
                                            ./ChannelUpDown.sh;;
        "BS")                               $rBS;
                                            ./ChannelUpDown.sh;;
        "Volume control")                   ./AudioUpDownMute.sh;;
        "Channel 3digit input")             ./3Digit.sh;;
        "Multi Language")                   ;;
        "TV + Hand")                        ./Handy.sh;;
        "TV + Subtitle")                    ./Subtitle.sh;;
        "TV + Hand + Subtitle")             ./Subtitle+Handy.sh;;
        "Use portal site")                  $rMedekiku;;
        "Standart setting")                 ./StandartSetting.sh;;
        "TV setting")                       ./TVSetting.sh;;
        "Extra setting") ;;
        "Secret menu") ;;
    esac
    fPath="Results-$DATE/";
    if [[ ! -d "$fPath" ]];
    then
        echo "The date has changed.";
        mkdir "$fPath";
        for i in $(seq 0 3)
        do
            case $i in
                0)      echo -n "Creating new folder ";;
                1|2)    echo -n ".";;
                3)      echo ".";;
            esac
        sleep 1;
        done
    fi
}

device=`adb devices | grep -v "List"  | awk '{print $1}'`
#Check if already connected or not
while [ "$device" = "" ];
do
    read -p "Enter IP : " ip
    adb connect 192.168.0.$ip;
    device=`adb devices | grep -v "List"  | awk '{print $1}'`
done
clear;
#Make results folder
DATE=`date '+%Y-%m-%d'`
fPath="Results-$DATE/";
createFolder "$fPath";
#Ouput Test item menu
while [ "$exit" != true ]
do
    echo "1) Booting";
    echo "2) TV";
    echo "3) Medekiku";
    echo "4) Portal site";
    echo "5) Setting";
    echo "6) Remote";
    echo "Press '*' to exit";
    read -p "Enter test item : " item
    clear;
    case $item in
        1)  echo "**********Booting test***********";
            echo "1) First boot software";
            echo "2) Boot after setting hardware";
            echo "3) SW stand by";
            echo "4) Boot after setting software";
            read -p "Enter subitem to test : " subitem
            case $subitem in
                1)  runTest "First boot hardware";;
                2)  runTest "Boot after setting hardware";;
                3)  runTest "SW stand by";;
                4)  runTest "Boot after setting software";;
            esac;;
        2)  echo "**********TV test***********";
            echo "1) Terrestrial digital";
            echo "2) BS";
            echo "3) Volume control";
            echo "4) Channel 3digit input";
            echo "5) Multi Language";
            read -p "Enter subitem to test : " subitem
            case $subitem in
                1)  runTest "Terrestrial digital";;
                2)  runTest "BS";;
                3)  runTest "Volume control";;
                4)  runTest "Channel 3digit input";;
                5)  runTest "Multi Language";;
            esac;;
        3)  echo "**********Medekiku test***********";
            echo "1) TV + Hand";
            echo "2) TV + Subtitle";
            echo "3) TV + Hand + Subtitle";
            read -p "Enter subitem to test : " subitem
            case $subitem in
                1)  runTest "TV + Hand";;
                2)  runTest "TV + Subtitle";;
                3)  runTest "TV + Hand + Subtitle";;
            esac;;
        4)  echo "**********Portal site test***********";
            runTest "Use portal site";;
        5)  echo "**********Setting test***********";
            echo "1) Standart setting";
            echo "2) TV setting";
            echo "3) Extra setting";
            echo "4) Secret menu";
            read -p "Enter TV mode : " subitem
            case $subitem in
                1)  runTest "Standart setting";;
                2)  runTest "TV setting";;
                3)  runTest "Extra setting";;
                4)  runTest "Secret menu ";;
            esac;;
        6)  echo "**********Remote test***********";;
        *)  echo "Exit";
            exit=true;;
    esac
    clear;
done
