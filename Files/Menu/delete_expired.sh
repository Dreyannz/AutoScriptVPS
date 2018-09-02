#!/bin/bash
# Script by : _Dreyannz_
datenow=$(date +%s)
for user in $(awk -F: '{print $1}' /etc/passwd); do
expdate=$(chage -l $user|awk -F: '/Account expires/{print $2}')
echo $expdate|grep -q never && continue
echo -n "User \`$user' expires on $expdate ... "
expsec=$(date +%s --date="$expdate")
diff=$(echo $datenow - $expsec|bc -l)
echo $diff|grep -q ^\- && echo okay && continue
# got this far, account must have expired
userdel -r $user  &> /dev/null
done
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m        All Expired Users Has Been Deleted        "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"

