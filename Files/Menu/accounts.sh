#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m            [1]  Create"
echo -e "\e[93m            [2]  Create Random"
echo -e "\e[93m            [3]  Create Trial"
echo -e "\e[93m            [4]  User List"
echo -e "\e[93m            [5]  User Details"
echo -e "\e[93m            [6]  User Extend"
echo -e "\e[93m            [7]  User Delete"
echo -e "\e[93m            [8]  User Lock"
echo -e "\e[93m            [9]  User Unlock"
echo -e "\e[93m            [10] Connections"
echo -e "\e[93m            [11] Delete Expired"
echo -e "\e[93m            [12] Locked List"
echo -e "\e[93m            [x]  Exit"
echo -e "\e[0m                                                   "
read -p "      Select From Options [1-12 or x] :  " Accounts
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3
clear
case $Port in
		1)
		clear
		create
		exit
		;;
		2)
		clear
		create_random
		exit
		;;
		3)
		clear
		create_trial
		exit
		;;
		4)
		clear
		user_list
		exit
		;;
		5)
		clear
		user_details
		exit
		;;
		6)
		clear
		user_extend
		exit
		;;
		7)
		clear
		user_delete
		exit
		;;
		8)
		clear
		user_lock
		exit
		;;
		9)
		clear
		user_unlock
		exit
		;;
		10)
		clear
		connections
		exit
		;;
		11)
		clear
		delete_expired
		exit
		;;
		12)
		clear
		locked_list
		exit
		;;
		x)
		clear
		exit
		;;
	esac