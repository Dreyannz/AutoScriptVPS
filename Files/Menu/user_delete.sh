#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
read -p "         Username       :  " User
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 2
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	userdel -f $User
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
	echo -e "\e[0m                                                   "
	echo -e "\e[93m                   User Deleted                   "
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"
else
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
	echo -e "\e[0m                                                   "
	echo -e "\e[93m                 User Doesnt Exist                "
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"