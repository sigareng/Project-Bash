#!/bin/bash
case $1 in
mati)
read -p 'Sekarang (y/n) ?' jwb
if [[ $jwb =~ ^[Yy]$ ]]; then
	#statements
	echo starting Shutdown
	sudo Shutdown -h now
else
	read -p 'mau pakai timer (y/n) ? ' jwb2
	if [[ $jwb2 =~ ^[Yy]$ ]]; then
		#statements
		echo -n "sekarang hari "
		date +"%A dan jam %T"
		read -p 'Mau jam Berapa [24hrs] :' jwb3
		echo memproses perintah
		echo halt now $jwb3
		sudo bash -c "shutdown -h $jwb3"
		else
			exit
	fi
fi

#sudo bash -c "sleep 3s; pm-suspend"
;;
tdr)
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
		else
			exit
	fi
fi
;;
rst)
read -p 'Sekarang (y/n) ?' rst
if [[ $rst =~ ^[Yy]$ ]]; then
	#statements
	echo starting Restart
	sudo shutdown -r now
else
	read -p 'mau pakai timer (y/n) ? ' rst2
	if [[ $rst2 =~ ^[Yy]$ ]]; then
		#statements
		echo -n "sekarang hari "
		date +"%A dan jam %T"
		echo "info"
		echo "s=second"
		echo "m=minute"
		echo "h=hour"
		read -p 'mulai timer :' rst3
		echo memproses perintah
		echo suspen sekarang
		sudo bash -c "sleep $rst3; pm-suspend"
		else
			exit
	fi
fi
;;
*)
echo don\'t know
echo "WELCOME"
echo "Silakan Pilih :"
echo "1.Shutdown"
echo "2.Suspend"
echo "3.Restart"
echo -n "Apa Pilihanmu :"
read ques1
echo "Baik akan sy lakukan"
echo "sekarang atau nanti ?"
echo -n "jawab Y jika sekarang : "
read ques2
#sudo bash -c "sleep 3s; pm-suspend"
esac