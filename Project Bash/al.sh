#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="www.officialsaipul.cf"
TITLE="Timer"
MENU="Pilih menu dibawah ini :"

OPTIONS=(1 "Shutdown"
         2 "Suspend"
         3 "Restart"
         4 "timee")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
1)

read -p 'Sekarang (y/n) ?' jwb
if [[ $jwb =~ ^[Yy]$ ]]; then
    #statements
    echo starting Shutdown
    sudo Shutdown -h now
    clear
else
    read -p 'mau pakai timer (y/n) ? ' jwb2
    if [[ $jwb2 =~ ^[Yy]$ ]]; then
        #statements
        echo ketik dalam hitungan detik
        echo -n "sekarang hari "
        date +"%A dan jam %T"
        read -p 'Mau jam Berapa [24hrs] :' jwb3
        echo memproses perintah
        echo halt now $jwb3
        sudo shutdown -h $jwb3
        else
            exit
    fi
fi

#sudo bash -c "sleep 3s; pm-suspend"
;;
2)
read -p 'Sekarang (y/n) ?' tdr
if [[ $tdr =~ ^[Yy]$ ]]; then
    #statements
    echo starting Suspend
    sudo bash -c "sleep 1s; pm-suspend"
else
    read -p 'mau pakai timer (y/n) ? ' tdr2
    if [[ $tdr2 =~ ^[Yy]$ ]]; then
        #statements
        echo -n "sekarang hari "
        date +"%A dan jam %T"
        echo "info"
        echo "s=second"
        echo "m=minute"
        echo "h=hour"
        read -p 'mulai timer :' tdr3
        echo memproses perintah
        echo suspen sekarang
        sudo bash -c "sleep $tdr3; pm-suspend"
        clear
        else
            exit
    fi
fi
;;
3)
read -p 'Sekarang (y/n) ?' rst
if [[ $rst =~ ^[Yy]$ ]]; then
    #statements
    echo starting Restart
    sudo shutdown -r now
    clear
else
    read -p 'mau pakai timer (y/n) ? ' rst2
    if [[ $rst2 =~ ^[Yy]$ ]]; then
        #statements
        echo -n "sekarang hari "
        date +"%A dan jam %T"
        read -p 'Mau jam Berapa [24hrs] :' rst3
        echo memproses perintah
        echo Restart akan di lakukan pada jam $rst3
        sudo bash -c "shutdown -r $rst3"
        clear
        else
            exit
    fi
fi
;;
4)
DIALOG=${DIALOG=dialog}
USERTIME=`$DIALOG --stdout --title "TIMEBOX" --timebox "Please set the time..." 0 0`

case $? in
  0)
    echo "Time entered: $USERTIME.";;
  1)
    echo "Cancel pressed."
    case $? in
        pattern )
            ;;
    esac

    ;;
  255)
    echo "Box closed."
    ;;
esac
;;

255)
    clear
    echo "Box closed."
    ;;
esac
