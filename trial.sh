#!/bin/bash
#AutoScript Create Trial Accounts
#All Trial Accounts last for 1 day
#Modified by Bustami Arifin
#Translated by _Dreyannz_

clear
echo -e ""
echo -e ":::::::::  :::::::::: :::::::::  :::::::::::"
echo -e ":+:    :+: :+:        :+:    :+: :+:     :+:"
echo -e "+:+    +:+ +:+        +:+    +:+        +:+ "
echo -e "+#+    +:+ +#++:++#   +#++:++#+        +#+  "
echo -e "+#+    +#+ +#+        +#+    +#+      +#+   "
echo -e "#+#    #+# #+#        #+#    #+#     #+#    "
echo -e "#########  ########## #########      ###    "
echo -e ""
echo -e "Deb7AutoScriptVPS by _Dreyannz_"
echo -e ""
echo -e ""

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e ""
echo -e ""
echo -e "===Trial Account Information==="
echo -e ""
echo -e "Username        : $Login"
echo -e "Password        : $Pass\n"
echo -e ""
echo -e "Host / IP       : $IP" 
echo -e "Port OpenSSH    : 22, 444"
echo -e "Port Dropbear   : 143, 3128"
echo -e "SSL             : 443"
echo -e "Port Squid      : 8080, 8000"
echo -e "Port OpenVPN    : TCP 1194"
echo -e "OpenVPN Config  : http://$IP:81/client.ovpn"
echo -e ""
echo -e "==============================="
echo -e ""
echo -e ""
echo -e ""
