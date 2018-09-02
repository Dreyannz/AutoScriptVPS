#!/bin/bash
# Script by : _Dreyannz_
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
read -p "         Username       :  " User

# Check If Username Exist, Else Proceed
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m              Username Already Exist              "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
exit 0
else
read -p "         Password       :  " Pass
read -p "         Active Days    :  " Days
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
clear
sleep 1
MYIP=$(wget -qO- ipv4.icanhazip.com)
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
useradd $User
usermod -s /bin/false $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "         Username        :  $User"
echo -e "         Password        :  $Pass"
echo -e "         Expires on      :  $Expiration_Display"
echo -e "\e[0m                                                   "	
echo -e "         Host / IP       :  "$MYIP
echo -e "         Port OpenSSH    :  "$opensshport
echo -e "         Port Dropbear   :  "$dropbearport
echo -e "         Port SSL        :  "$stunnel4port
echo -e "         Port Squid      :  "$squidport
echo -e "         Port OpenVPN    :  "$openvpnport
echo -e "              $MYIP/client.ovpn"
echo -e "                                                  "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
fi