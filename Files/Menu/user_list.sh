#!/bin/bash
# Script by : _Dreyannz_
if [ -f /etc/debian_version ]; then
	UIDN=1000
elif [ -f /etc/redhat-release ]; then
	UIDN=500
else
	UIDN=500
fi
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m           Username          Expiration           \e[0m"
echo " "
while read Checklist
do
        Spacer="    "
        Account="$(echo $Checklist | cut -d: -f1)"
        ID="$(echo $Checklist | grep -v nobody | cut -d: -f3)"
        Exp="$(chage -l $Account | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge $UIDN ]]; then
        printf "%-26s : %5s\n" "           $Account"    "$Exp"
        fi
done < /etc/passwd
No_Users="$(awk -F: '$3 >= '$UIDN' && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
echo -e "\e[0m                                                   "
echo -e "\e[93m              Number of Users: "$No_Users
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
