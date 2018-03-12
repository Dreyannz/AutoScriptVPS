#!/bin/bash
#Script auto create user SSH

clear
read -p "Username    : " Login
read -p "Password    : " Pass
read -p "Expiration  : " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e ""
echo -e ""
echo -e "======Account Information======"
echo -e ""
echo -e "Username        : $Login "
echo -e "Password        : $Pass"
echo -e "Expires on      : $exp"
echo -e ""
echo -e "Host / IP       : $IP" 
echo -e "Port OpenSSH    : 22, 444"
echo -e "Port Dropbear   : 143, 3128"
echo -e "Port SSL        : 443"
echo -e "Port Squid      : 8000, 8080"
echo -e "Port OpenVPN    : TCP 1194"
echo -e "OpenVPN Config  : http://$IP:81/client.ovpn"
echo -e ""
echo -e "==============================="
echo -e ""
echo -e ""
echo -e ""
