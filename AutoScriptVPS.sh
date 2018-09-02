#!/bin/bash
# Original script by : fornesia, rzengineer and fawzya
# Modified by : _Dreyannz_
# ==================================================
# Initializing Var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
SOURCE_RAW="https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/Files";
SOURCE_FILE="https://github.com/Dreyannz/Deb7AutoScriptVPS/raw/master/Files"

# Root Directory
cd

# Disable IPV6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# Install wget and curl
apt-get update;apt-get -y install wget curl;

# Local Time Manila
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# Local Configuration
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# Repo Sources
wget -O /etc/apt/sources.list "$SOURCE/Source/source.list.debian8";
wget "http://www.dotdeb.org/dotdeb.gpg"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg

# Update
apt-get update

# Install Essential Packages
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar

echo "clear"                                                              >> .bashrc
echo 'echo -e "\e[0m                                                   "' >> .bashrc
echo 'echo -e "\e[94m    :::::::::  :::::::::   ::::::::  :::   :::    "' >> .bashrc
echo 'echo -e "\e[94m    :+:    :+: :+:    :+: :+:    :+: :+:   :+:    "' >> .bashrc
echo 'echo -e "\e[94m    +:+    +:+ +:+    +:+        +:+  +:+ +:+     "' >> .bashrc
echo 'echo -e "\e[94m    +#+    +:+ +#++:++#:      +#++:    +#++:      "' >> .bashrc
echo 'echo -e "\e[94m    +#+    +#+ +#+    +#+        +#+    +#+       "' >> .bashrc
echo 'echo -e "\e[94m    #+#    #+# #+#    #+# #+#    #+#    #+#       "' >> .bashrc
echo 'echo -e "\e[94m    #########  ###    ###  ########     ###       "' >> .bashrc
echo 'echo -e "\e[94m           AutoScriptVPS by  _Dreyannz_           "' >> .bashrc
echo 'echo -e "\e[0m"'                                                    >> .bashrc
echo 'echo -e "\e[94m             [accounts/options/server]            "' >> .bashrc
echo 'echo -e "\e[0m                                                   "' >> .bashrc

# Install WebServer
apt-get -y install nginx

# WebServer Configuration
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "$SOURCE_RAW/Nginx/nginx.conf"
mkdir -p /home/vps/public_html
echo "<h1><center>AutoScript by _Dreyannz_</center></h1>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "$SOURCE_RAW/Nginx/vps.conf"
service nginx restart

# Install OpenVPN
apt-get -y install openvpn easy-rsa openssl iptables
cp -r /usr/share/easy-rsa/ /etc/openvpn
mkdir /etc/openvpn/easy-rsa/keys
sed -i 's|export KEY_COUNTRY="US"|export KEY_COUNTRY="PH"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_PROVINCE="CA"|export KEY_PROVINCE="Manila"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_CITY="SanFrancisco"|export KEY_CITY="Manila"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_ORG="Fort-Funston"|export KEY_ORG="CoffeeWorks"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_EMAIL="me@myhost.mydomain"|export KEY_EMAIL="dreyannzoctat@gmail.com"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU="MyOrganizationalUnit"|export KEY_OU="CoffeeWorks"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_NAME="EasyRSA"|export KEY_NAME="Dreyannz"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU=changeme|export KEY_OU=Dreyannz|' /etc/openvpn/easy-rsa/vars

# Create Diffie-Helman Pem
openssl dhparam -out /etc/openvpn/dh2048.pem 2048

# Create PKI
cd /etc/openvpn/easy-rsa
. ./vars
./clean-all
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --initca $*

# Create key server
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --server server

# Setting KEY CN
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" client


# cp /etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt} /etc/openvpn
cd
cp /etc/openvpn/easy-rsa/keys/server.crt /etc/openvpn/server.crt
cp /etc/openvpn/easy-rsa/keys/server.key /etc/openvpn/server.key
cp /etc/openvpn/easy-rsa/keys/ca.crt /etc/openvpn/ca.crt

# Setting Server
cd /etc/openvpn/
wget "$SOURCE_RAW/OpenVPN/server.conf"

#Create OpenVPN Config
cd
mkdir -p /home/vps/public_html
cd /home/vps/public_html/
wget "SOURCE_RAW/OpenVPN/client.ovpn"
sed -i $MYIP2 /home/vps/public_html/client.ovpn;
echo '<ca>' >> /home/vps/public_html/client.ovpn
cat /etc/openvpn/ca.crt >> /home/vps/public_html/client.ovpn
echo '</ca>' >> /home/vps/public_html/client.ovpn
cd /home/vps/public_html/
tar -czf /home/vps/public_html/openvpn.tar.gz client.ovpn
tar -czf /home/vps/public_html/client.tar.gz client.ovpn
cd

# Restart OpenVPN
/etc/init.d/openvpn restart
service openvpn start
service openvpn status

# Setting USW
apt-get install ufw
ufw allow ssh
ufw allow 1194/tcp
sed -i 's|DEFAULT_INPUT_POLICY="DROP"|DEFAULT_INPUT_POLICY="ACCEPT"|' /etc/default/ufw
sed -i 's|DEFAULT_FORWARD_POLICY="DROP"|DEFAULT_FORWARD_POLICY="ACCEPT"|' /etc/default/ufw
cd /etc/ufw/
wget "SOURCE_RAW/OpenVPN/before.rules"
cd
ufw enable
ufw status
ufw disable

# set ipv4 forward
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf

# Install BadVPN
cd
wget -O /usr/bin/badvpn-udpgw "$SOURCE_FILE/BadVPN/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "$SOURCE_FILE/BadVPN/badvpn-udpgw64"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# SSH Configuration
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
service ssh restart

# Install Dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 80"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# Install Squid3
cd
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "$SOURCE/Squid/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# Install WebMin
cd
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart

# Install Stunnel
apt-get -y install stunnel4
wget -O /etc/stunnel/stunnel.pem "$SOURCE_RAW/Stunnel/stunnel.pem"
wget -O /etc/stunnel/stunnel.conf "$SOURCE_RAW/Stunnel/stunnel.conf"
sed -i $MYIP2 /etc/stunnel/stunnel.conf
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart

# Install Fail2Ban
apt-get -y install fail2ban;
service fail2ban restart

# Install DDOS Deflate
cd
apt-get -y install dnsutils dsniff
wget "$SOURCE_FILE/Others/ddos-deflate-master.zip"
unzip ddos-deflate-master.zip
cd ddos-deflate-master
./install.sh
cd
rm -rf ddos-deflate-master.zip

# Banner
rm /etc/issue.net
wget -O /etc/issue.net "$SOURCE_RAW/Others/issue.net"
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
service ssh restart
service dropbear restart

# XML Parser
cd
apt-get -y --force-yes -f install libxml-parser-perl

# Install Screenfetch
apt-get -y install lsb-release scrot
wget -O screenfetch "$SOURCE_RAW/Others/screenfetch"
chmod +x screenfetch

#Setting IPtables
cd /etc/
wget "$SOURCE_RAW/Others/iptables.up.rules"
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i $MYIP2 /etc/iptables.up.rules;
iptables-restore < /etc/iptables.up.rules
cd

# Download Script
cd /usr/bin
wget -O menu "$SOURCE_RAW/Menu/menu.sh"
wget -O accounts "$SOURCE_RAW/Menu/accounts.sh"
wget -O create "$SOURCE_RAW/Menu/create.sh"
wget -O create_random "$SOURCE_RAW/Menu/create_random.sh"
wget -O create_trial "$SOURCE_RAW/Menu/create_trial.sh"
wget -O user_list "$SOURCE_RAW/Menu/user_list.sh"
wget -O user_details "$SOURCE_RAW/Menu/user_details.sh"
wget -O user_details_lib "$SOURCE_RAW/Menu/user_details_lib.sh"
wget -O user_extend "$SOURCE_RAW/Menu/user_extend.sh"
wget -O user_delete "$SOURCE_RAW/Menu/user_delete.sh"
wget -O user_lock "$SOURCE_RAW/Menu/user_lock.sh"
wget -O user_unlock "$SOURCE_RAW/Menu/user_unlock.sh"
wget -O connections "$SOURCE_RAW/Menu/connections.sh"
wget -O delete_expired "$SOURCE_RAW/Menu/delete_expired.sh"
wget -O locked_list "$SOURCE_RAW/Menu/locked_list.sh"
wget -O options_menu "$SOURCE_RAW/Menu/options_menu.sh"
wget -O set_multilogin_autokill "$SOURCE_RAW/Menu/set_multilogin_autokill.sh"
wget -O set_multilogin_autokill_lib "$SOURCE_RAW/Menu/set_multilogin_autokill_lib.sh"
wget -O restart_services "$SOURCE_RAW/Menu/restart_services.sh"
wget -O edit_ports "$SOURCE_RAW/Menu/edit_ports.sh"
wget -O show_ports "$SOURCE_RAW/Menu/show_ports.sh"
wget -O edit_openssh "$SOURCE_RAW/Menu/edit_openssh.sh"
wget -O edit_dropbear "$SOURCE_RAW/Menu/edit_dropbear.sh"
wget -O edit_stunnel4 "$SOURCE_RAW/Menu/edit_stunnel4.sh"
wget -O edit_openvpn "$SOURCE_RAW/Menu/edit_openvpn.sh"
wget -O edit_squid3 "$SOURCE_RAW/Menu/edit_squid3.sh"
wget -O reboot_sys "$SOURCE_RAW/Menu/reboot_sys.sh"
wget -O reboot_sys_auto "$SOURCE_RAW/Menu/reboot_sys_auto.sh"
wget -O clearcache "$SOURCE_RAW/Menu/clearcache.sh"
wget -O server_menu "$SOURCE_RAW/Menu/server_menu.sh"
wget -O ram "$SOURCE_RAW/Menu/ram"
wget -O diagnose "$SOURCE_RAW/Menu/diagnose"
wget -O bench-network "$SOURCE_RAW/Menu/bench-network"
wget -O speedtest "$SOURCE_RAW/Menu/speedtest"


# AutoReboot Tools
echo "10 0 * * * root /usr/local/bin/reboot_sys" > /etc/cron.d/reboot_sys
echo "0 1 * * * root delete_expired" > /etc/cron.d/delete_expired
echo "*0 */2 * * * root clearcache" > /etc/cron.d/clearcache

# Set Permissions
chmod +x create
chmod +x accounts
chmod +x create
chmod +x create_random
chmod +x create_trial
chmod +x user_list
chmod +x user_details
chmod +x user_details_lib
chmod +x user_extend
chmod +x user_delete
chmod +x user_lock
chmod +x user_unlock
chmod +x connections
chmod +x delete_expired
chmod +x locked_list
chmod +x options_menu
chmod +x set_multilogin_autokill
chmod +x set_multilogin_autokill_lib
chmod +x restart_services
chmod +x edit_ports
chmod +x show_ports
chmod +x edit_openssh
chmod +x edit_dropbear
chmod +x edit_stunnel4
chmod +x edit_openvpn
chmod +x edit_squid3
chmod +x reboot_sys
chmod +x reboot_sys_auto
chmod +x clearcache
chmod +x server_menu
chmod +x ram
chmod +x diagnose
chmod +x bench-network
chmod +x speedtest

# Finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
service webmin restart
rm -rf ~/.bash_history && history -c
rm -f /root/AutoScript_VPS.sh
echo "unset HISTFILE" >> /etc/profile

# grep ports 
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
nginxport="$(netstat -nlpt | grep -i nginx| grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

# Info
clear
echo -e ""
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[94m           AutoScriptVPS by  _Dreyannz_           "
echo -e "\e[94m                                                  "
echo -e "\e[94m                    Services                      "
echo -e "\e[94m                                                  "
echo -e "\e[94m    OpenSSH        :   "$opensshport
echo -e "\e[94m    Dropbear       :   "$dropbearport
echo -e "\e[94m    SSL            :   "$stunnel4port
echo -e "\e[94m    OpenVPN        :   "$openvpnport
echo -e "\e[94m    Port Squid     :   "$squidport
echo -e "\e[94m    Nginx          :   "$nginxport
echo -e "\e[94m                                                  "
echo -e "\e[94m              Other Features Included             "
echo -e "\e[94m                                                  "
echo -e "\e[94m    Timezone       :   Asia/Manila (GMT +7)       "
echo -e "\e[94m    Webmin         :   http://$MYIP:10000/        "
echo -e "\e[94m    IPV6           :   [OFF]                      "
echo -e "\e[94m    Cron Scheduler :   [ON]                       "
echo -e "\e[94m    Fail2Ban       :   [ON]                       "
echo -e "\e[94m    DDOS Deflate   :   [ON]                       "
echo -e "\e[94m    LibXML Parser  :   {ON]                       "
echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
echo -e "\e[0m                                                   "
read -n1 -r -p "          Press Any Key To Show Commands          "
menu
cd