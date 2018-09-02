#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1] Reboot Every 1 Hour"
echo -e "\e[93m            [2] Reboot Every 2 Hours"
echo -e "\e[93m            [3] Reboot Every 12 Hours"
echo -e "\e[93m            [4] Reboot Once A Day"
echo -e "\e[93m            [5] Reboot Once A Week"
echo -e "\e[93m            [6] Reboot Once A Month"
echo -e "\e[93m            [7] Remove Reboot"
echo -e "\e[93m            [x] Exit"
echo -e "\e[0m                                                   "
read -p "       Select From Options [1-7 or x] :  " Reboot_Sys
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3
clear
case $Reboot_Sys in
		1)
		clear
		echo "10 * * * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m            Auto-Reboot Set Every Hour            "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		2)
		clear
		echo "10 */6 * * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           Auto-Reboot Set Every 2 Hours          "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		3)
		clear
		echo "10 */12 * * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m          Auto-Reboot Set Every 12 Hours          "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		4)
		clear
		echo "10 0 * * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m            Auto-Reboot Set Once A Day            "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		5)
		clear
		echo "10 0 */7 * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           Auto-Reboot Set Once A Week            "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		6)
		clear
		echo "10 0 1 * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           Auto-Reboot Set Once A Month           "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		7)
		clear
		rm -f /etc/cron.d/reboot_sys
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m                Auto-Reboot Removed               "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		x)
		clear
		exit
		;;
	esac