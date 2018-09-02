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
echo -e "\e[93m              User Has Been Unlocked              "
echo -e "\e[93m      User Has Been Removed from Locked_List      "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
passwd -u $User
sed -i 's/$User//g' /etc/Locked_List.txt

exit
else
  clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m                User Is Not Locked                "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
exit
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