#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
read -p "         No. of Users   :  " No_User
read -p "         Active Days    :  " Days
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 2
clear
Today="$(date +"%Y-%m-%d")"
Expire_On=$(date -d "$Days days" +"%Y-%m-%d")
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
for (( i=1; i <= $No_User; i++ ))
do
	USER=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`
	useradd -M -N -s /bin/false -e $Expire_On $USER
	PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $USER:$USER | chpasswd
	echo -e "         Username/Pass   :  "$USER
done
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
