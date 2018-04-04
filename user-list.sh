#!/bin/bash
clear
echo -e "                                                        "
echo -e "\e[94m   :::::::::  :::::::::: :::::::::  :::::::::::   "
echo -e "\e[94m   :+:    :+: :+:        :+:    :+: :+:     :+:   "
echo -e "\e[94m   +:+    +:+ +:+        +:+    +:+        +:+    "
echo -e "\e[94m   #+    +:+ +#++:++#   +#++:++#+        +#+      "
echo -e "\e[94m   +#+    +#+ +#+        +#+    +#+      +#+      "
echo -e "\e[94m   #+#    #+# #+#        #+#    #+#     #+#       "
echo -e "\e[94m   #########  ########## #########      ###       "
echo -e "\e[94m         Deb7AutoScriptVPS by _Dreyannz_          "
echo -e "\e[0m                                                   "
echo -e ""
echo -e ""
echo -e ""
echo "-------------------------------"
echo "USERNAME          EXP DATE     "
echo "-------------------------------"
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
echo "Number of Accounts : $JUMLAH user"
echo "-------------------------------"
echo -e ""
echo -e ""
echo -e ""
