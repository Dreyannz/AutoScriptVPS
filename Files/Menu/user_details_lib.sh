#!/bin/bash
# Script by : _Dreyannz_
Username=`cat /etc/passwd | grep -Ew ^$1 | cut -d":" -f1`
if [ "$Username" = "" ]
then
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
	echo -e "\e[0m                                                   "
	echo -e "\e[93m              Username Doesnt Exist               "
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"
	exit
fi
Userid=`cat /etc/passwd | grep -Ew ^$Username | cut -d":" -f3`
UserPrimaryGroupId=`cat /etc/passwd | grep -Ew ^$Username | cut -d":" -f4`
UserPrimaryGroup=`cat /etc/group | grep :"$UserPrimaryGroupId": | cut -d":" -f1`
UserInfo=`cat /etc/passwd | grep -Ew ^$Username | cut -d":" -f5`
UserHomeDir=`cat /etc/passwd | grep -Ew ^$Username | cut -d":" -f6`
UserShell=`cat /etc/passwd | grep -Ew ^$Username | cut -d":" -f7`
UserGroups=`groups $Username | awk -F": " '{print $2}'`
PasswordExpiryDate=`chage -l $Username | grep "Password expires" | awk -F": " '{print $2}'`
LastPasswordChangeDate=`chage -l $Username | grep "Last password change" | awk -F": " '{print $2}'`
AccountExpiryDate=`chage -l $Username | grep "Account expires" | awk -F": " '{print $2}'`
HomeDirSize=`du -hs $UserHomeDir | awk '{print $1}'`
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
printf "%-25s : %5s\n"   "      Username                 " "$Username"
printf "%-25s : %5s\n"   "      Password previous change " "$LastPasswordChangeDate"
printf "%-25s : %5s\n"   "      Account Date Expired     " "$AccountExpiryDate"
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"