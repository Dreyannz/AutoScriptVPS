#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1]  AutoKill After 5 Minutes"
echo -e "\e[93m            [2]  AutoKill After 15 Minutes"
echo -e "\e[93m            [3]  AutoKill After 30 Minutes"
echo -e "\e[93m            [4]  Turn Off AutoKill/MultiLogin"
echo -e "\e[93m            [x]  Exit"
echo -e "\e[0m                                                   "
read -p "       Select From Options [1-5 or x] :  " AutoKill
echo -e "\e[0m                                                   "
case $AutoKill in
		1)
		read -p "            Allowed MultiLogin        :  " -e -i 1 MultiLogin
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		sleep 4
		clear
		echo "*/5 * * * *  root /usr/bin/set_multilogin_autokill_lib $MultiLogin" > /etc/cron.d/set_multilogin_autokill_lib
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m             Allowed MultiLogin : "$MultiLogin
		echo -e "\e[93m             AutoKill Every     : 5 Minutes"
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		2)
		read -p "            Allowed MultiLogin        :  " -e -i 1 MultiLogin
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"s
		sleep 4
		clear
		echo "*/15 * * * *  root /usr/bin/set_multilogin_autokill_lib $MultiLogin" > /etc/cron.d/set_multilogin_autokill_lib
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m             Allowed MultiLogin : "$MultiLogin
		echo -e "\e[93m             AutoKill Every     : 15 Minutes"
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		3)
		read -p "            Allowed MultiLogin        :  " -e -i 1 MultiLogin
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		sleep 4
		clear
		echo "*/30 * * * *  root /usr/bin/set_multilogin_autokill_lib $MultiLogin" > /etc/cron.d/set_multilogin_autokill_lib
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m             Allowed MultiLogin : "$MultiLogin
		echo -e "\e[93m             AutoKill Every     : 30 Minutes"
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		4)
		clear
		rm -f /etc/cron.d/set_multilogin_autokill_lib
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m              AutoKill MultiLogin Turned               "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		x)
		clear
		exit
		;;
	esac