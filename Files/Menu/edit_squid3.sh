#!/bin/bash
# Script by : _Dreyannz_
rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpnport
rm -f /root/squidport
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpnport > /root/openvpnport
cat > /root/openvpnport <<-END
$openvpnport
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[0m                                                   "
echo -e "\e[93m                   Squid3  Port                   "
echo -e "\e[93m               "$squidport
echo -e "\e[0m                                                   "
read -p "       Which Port Should Be Changed? :  " Port
egrep "^$Port" /root/squidport >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              OpenSSH Port Conflict               "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Stunnel4 Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              OpenVPN Port Conflict               "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[94m[][][]======================================[][][]\e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/squid3/squid.conf
	service squid3 restart > /dev/null
	rm -f /root/squidport
	squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m           AutoScriptVPS by  _Dreyannz_           "
	echo -e "\e[0m                                                   "
	echo -e "\e[93m                   Squid3  Port                   "
	echo -e "\e[93m               "$squidport
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"

else
	echo -e "\e[0m                                                   "
	echo -e "\e[91m                 Port Doesnt Exit                 "
	echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"
fi
