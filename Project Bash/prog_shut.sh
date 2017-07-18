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
         3 "Restart")

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
dialog --title "Konfirmasi"  --yesno "Mau Sekarang atau?" 6 22

case $? in
    0 )
        dialog --infobox "Sedang dalam Proses, Mohon tunggu" 3 34 ; sudo Shutdown -h now
        clear
        ;;
    1 )
        dialog --title "Konfirmasi"  --yesno "Mau Pakai Timer?" 6 20
        
        case $? in
            0 )
                OUTPUT="/tmp/input.txt"
                >$OUTPUT
                dialog --title "Inputbox" \
                --backtitle "$BACKTITLE" \
--inputbox "info  :
ketik dalam hitungan detik, atau
ketik Jam yang di inginkan
dengan format hh:mm - [24jam]
//09:30
        " 13 60 2>$OUTPUT
                respose=$?
                tim=$(<$OUTPUT)
                case $respose in
                    0) 
                        clear
                        sudo shutdown -h ${tim} 
                        clear
                        ;;
                    1) 
                        clear
                        echo "Cancel pressed." 
                        ;;
                    255) 
                        clear
                        echo "[ESC] key pressed."
                esac
                rm $OUTPUT
                ;;
            1 )
                clear
                echo "Cancel pressed."
                ;;
            255 )
                clear
                echo "closed box"
                ;;
                    
        esac

        ;;
    255)
        clear
        echo "Box closed."
    ;;
esac
#sudo bash -c "sleep 3s; pm-suspend"
;;
2)
dialog --title "Konfirmasi"  --yesno "Mau Sekarang atau?" 6 22

case $? in
    0 )
        dialog --infobox "Sedang dalam Proses, Mohon tunggu" 3 34 ; sudo pm-suspend now
        clear
        ;;
    1 )
        dialog --title "Konfirmasi"  --yesno "Mau Pakai Timer?" 6 20
        
        case $? in
            0 )
                OUTPUT="/tmp/input.txt"
                >$OUTPUT
                dialog --title "Inputbox" \
                --backtitle "$BACKTITLE" \
--inputbox "info  :
ketik dalam ingin dimulai kapan
s=detik m=minute h=jam
//5m = 5 menit dari sekarang
        " 13 60 2>$OUTPUT
                respose=$?
                tim=$(<$OUTPUT)
                case $respose in
                    0) 
                        #(c=10 
                            #while [ $c -ne 110 ]
                            #do
                            #echo $c
                            #echo "###"
                            #echo "$c %"
                            #echo "###"
                            #((c+=10))
                            #sleep 1
                            #done)|dialog --title "A Test Gauge With dialog" --gauge "Please wait ...." 10 60 0
                        clear
                        sudo sleep ${tim}; sudo pm-suspend
                        clear
                        ;;
                    1) 
                        clear
                        echo "Cancel pressed." 
                        ;;
                    255) 
                        clear
                        echo "[ESC] key pressed."
                        ;;
                esac
                rm $OUTPUT
                ;;
            1 )
                clear
                echo "Cancel pressed."
                ;;
            255 )
                clear
                echo "closed box"
                ;;
                    
        esac

        ;;
    255)
        clear
        echo "Box closed."
    ;;
esac
#sudo bash -c "sleep 3s; pm-suspend"
;;
3)
dialog --title "Konfirmasi"  --yesno "Mau Sekarang atau?" 6 22

case $? in
    0 )
        dialog --infobox "Sedang dalam Proses, Mohon tunggu" 3 34 ; sudo shutdown -r now
        clear
        ;;
    1 )
        dialog --title "Konfirmasi"  --yesno "Mau Pakai Timer?" 6 20
        
        case $? in
            0 )
                OUTPUT="/tmp/input.txt"
                >$OUTPUT
                dialog --title "Inputbox" \
                --backtitle "$BACKTITLE" \
--inputbox "info  :
ketik dalam hitungan detik, atau
ketik Jam yang di inginkan
dengan format hh:mm - [24jam]
//09:30
        " 13 60 2>$OUTPUT
                respose=$?
                tim=$(<$OUTPUT)
                case $respose in
                    0) 
                        clear
                        sudo sleep ${tim}; sudo shutdown -r
                        clear
                        ;;
                    1) 
                        clear
                        echo "Cancel pressed." 
                        ;;
                    255) 
                        clear
                        echo "[ESC] key pressed."
                esac
                rm $OUTPUT
                ;;
            1 )
                clear
                echo "Cancel pressed."
                ;;
            255 )
                clear
                echo "closed box"
                ;;
                    
        esac

        ;;
    255)
        clear
        echo "Box closed."
    ;;
esac
#------------------------------------------------------------
#read -p 'Sekarang (y/n) ?' rst
#if [[ $rst =~ ^[Yy]$ ]]; then
    #statements
#    echo starting Restart
#    sudo shutdown -r now
#    clear
#else
#    read -p 'mau pakai timer (y/n) ? ' rst2
#    if [[ $rst2 =~ ^[Yy]$ ]]; then
#        #statements
#        echo -n "sekarang hari "
#        date +"%A dan jam %T"
#        read -p 'Mau jam Berapa [24hrs] :' rst3
#        echo memproses perintah
#        echo Restart akan di lakukan pada jam $rst3
#        sudo bash -c "shutdown -r $rst3"
#        clear
#        else
#            exit
#    fi
#fi
#-------------------------------------------------------------
;;
#-------------------------------------------------------------
#4)
#DIALOG=${DIALOG=dialog}
#USERTIME=`$DIALOG --stdout --title "TIMEBOX" --timebox "Please set the time..." 0 0`

#case $? in
#  0)
#    echo "Time entered: $USERTIME.";;
#  1)
#    echo "Cancel pressed."
#    case $? in
#        pattern )
#            ;;
#    esac

#    ;;
#  255)
#    echo "Box closed."
#    ;;
#esac
#;;

#255)
#    clear
#    echo "Box closed."
#    ;;
#-------------------------------------------------------------
esac
