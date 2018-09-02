#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1]  MultiLogin"
echo -e "\e[93m            [2]  Restart Services"
echo -e "\e[93m            [3]  Change Ports"
echo -e "\e[93m            [4]  Reboot"
echo -e "\e[93m            [x]  Exit"
echo -e "\e[0m                                                   "
read -p "       Select From Options [1-5 or x] :  " Options
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3
clear
case $Options in
		1)
		clear
		set_multilogin_autokill
		exit
		;;
		2)
		clear
		restart_services
		exit
		;;
		3)
		clear
		edit_ports
		exit
		;;
		4)
		clear
		reboot_sys
		exit
		;;
		x)
		clear
		exit
		;;
	esac