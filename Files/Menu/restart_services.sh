#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1] Restart All Services"
echo -e "\e[93m            [2] Restart OpenSSH"
echo -e "\e[93m            [3] Restart Dropbear"
echo -e "\e[93m            [4] Restart Stunnel4"
echo -e "\e[93m            [5] Restart OpenVPN"
echo -e "\e[93m            [6] Restart Squid"
echo -e "\e[93m            [7] Restart Nginx"
echo -e "\e[93m            [x] Exit"
echo -e "\e[0m                                                   "
read -p "       Select From Options [1-7 or x] :  " Restart
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3
clear
case $Restart in
		1)
		clear
		service ssh restart
		service dropbear restart
		service stunnel4 restart
		service openvpn restart
		service squid3 restart
		service nginx restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m                Service/s Restarted               "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		2)
		clear
		service ssh restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m              SSH Service Restarted               "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		3)
		clear
		service dropbear restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m            Dropbear Service Restarted            "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		4)
		clear
		service stunnel4 restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m            Stunnel4 Service Restarted            "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		5)
		clear
		service openvpn restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m            OpenVPN Service Restarted             "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		6)
		clear
		service squid3 restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m             Squid3 Service Restarted             "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		7)
		clear
		service nginx restart
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]"
		echo -e "\e[0m                                                   "
		echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
		echo -e "\e[0m                                                   "
		echo -e "\e[93m             Nginx Service Restarted              "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
		;;
		x)
		clear
		exit
		;;
	esac