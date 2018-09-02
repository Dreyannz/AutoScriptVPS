#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
read -p "         Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
sleep 1
if grep -Fxq "$User" /etc/Locked_List.txt
then
  clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[91m           User Has Been Locked Already           "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
exit
else
  clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[91m               User Has Been Locked               "
echo -e "\e[91m        User Has Been Added To Locked_List        "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
echo $User >> /etc/Locked_List.txt
passwd -l $User
fi

else
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
	echo -e "\e[0m                                                   "
	echo -e "\e[91m              Username Doesnt Exist               "
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"
	exit
    exit 1
fi