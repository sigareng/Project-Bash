read -p 'mau pakai timer (y/n) ? ' jwb2
	if [[ $jwb2 =~ ^[Yy]$ ]]; then
		#statements
		echo -n "sekarang hari "
		date +"%A dan jam %T"
		read -p 'Mau jam Berapa [24hrs] :' jwb3
		echo memproses perintah
		echo halt now $jwb3
		sudo bash -c "shutdown -h ${jwb3}"
	fi