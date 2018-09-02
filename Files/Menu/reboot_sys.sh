#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1] Reboot Now"
echo -e "\e[93m            [2] Reboot Time"
echo -e "\e[93m            [x] Exit"
echo -e "\e[0m                                                   "
read -p "       Select From Options [1-3 or x] :  " Reboot
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3
clear
case $Reboot in
		1)
		clear
		reboot
		exit
		;;
		2)
		clear
		reboot_sys_auto
		exit
		;;
		x)
		clear
		exit
		;;
	esac