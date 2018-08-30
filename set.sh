#!/bin/bash
#
# Original script by fornesia, rzengineer and fawzya
# Mod And Translation by _Dreyannz_
# ==================================================
# Initializing Var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

# Details of _Dreyannz_
country=PH
state=Manila
locality=Manila
organization=CoffeeWorks
organizationalunit=CoffeeWorks
commonname=CoffeeWorks
email=dreyannzoctat@gmail.com

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

wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg

# Update
apt-get update

# Install Essential Packages
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar

echo "clear"                                                              >> .bashrc
echo 'echo -e "\e[94m   :::::::::  :::::::::: :::::::::  :::::::::::   "' >> .bashrc
echo 'echo -e "\e[94m   :+:    :+: :+:        :+:    :+: :+:     :+:   "' >> .bashrc
echo 'echo -e "\e[94m   +:+    +:+ +:+        +:+    +:+        +:+    "' >> .bashrc
echo 'echo -e "\e[94m   +#+    +:+ +#++:++#   +#++:++#+        +#+     "' >> .bashrc
echo 'echo -e "\e[94m   +#+    +#+ +#+        +#+    +#+      +#+      "' >> .bashrc
echo 'echo -e "\e[94m   #+#    #+# #+#        #+#    #+#     #+#       "' >> .bashrc
echo 'echo -e "\e[94m   #########  ########## #########      ###       "' >> .bashrc
echo 'echo -e "\e[94m         Deb7AutoScriptVPS by _Dreyannz_          "' >> .bashrc
echo 'echo -e "\e[0m"'                                                    >> .bashrc
echo 'echo -e "\e[94m##################################################"' >> .bashrc
echo 'echo -e "\e[94m#   Commands           Description               #"' >> .bashrc
echo 'echo -e "\e[94m#                                                #"' >> .bashrc
echo 'echo -e "\e[94m#   menu       ----    Show Commands             #"' >> .bashrc
echo 'echo -e "\e[94m#   add        ----    Create User Account       #"' >> .bashrc
echo 'echo -e "\e[94m#   trial      ----    Create Trial Account      #"' >> .bashrc
echo 'echo -e "\e[94m#   remove     ----    Remove Account            #"' >> .bashrc
echo 'echo -e "\e[94m#   check      ----    Check Account Login       #"' >> .bashrc
echo 'echo -e "\e[94m#   member     ----    Check Users               #"' >> .bashrc
echo 'echo -e "\e[94m#   delexp     ----    Delete Expired Users      #"' >> .bashrc
echo 'echo -e "\e[94m#   banner     ----    Configure Server Message  #"' >> .bashrc
echo 'echo -e "\e[94m#   restart    ----    Restart Services          #"' >> .bashrc
echo 'echo -e "\e[94m#   reboot     ----    Reboot VPS                #"' >> .bashrc
echo 'echo -e "\e[94m#   speedtest  ----    Speedtest VPS             #"' >> .bashrc
echo 'echo -e "\e[94m#   info       ----    System Information        #"' >> .bashrc
echo 'echo -e "\e[94m#   about      ----    Deb7AutoScriptVPS Info    #"' >> .bashrc
echo 'echo -e "\e[94m#   exit       ----    Close Putty / JuiceSSH    #"' >> .bashrc
echo 'echo -e "\e[94m#                                                #"' >> .bashrc
echo 'echo -e "\e[94m##################################################"' >> .bashrc
echo 'echo -e "\e[0m                                                   "' >> .bashrc


# Install WebServer
apt-get -y install nginx

# WebServer Configuration
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by _Dreyannz_</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/vps.conf"
service nginx restart

# Install OpenVPN
wget -O /etc/openvpn/openvpn.tar "https://github.com/Dreyannz/Deb7AutoScriptVPS/raw/master/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/iptables"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart

# OpenVPN Configuration
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/client-1194.conf"
sed -i $MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn /home/vps/public_html/

# Install BadVPN
cd
wget -O /usr/bin/badvpn-udpgw "https://github.com/Dreyannz/Deb7AutoScriptVPS/raw/master/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://github.com/Dreyannz/Deb7AutoScriptVPS/raw/master/badvpn-udpgw64"
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
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# Install WebMin
cd
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart

# Install Stunnel
apt-get -y install stunnel4
wget -O /etc/stunnel/stunnel.pem "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/stunnel.pem"
wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/stunnel.conf"
sed -i $MYIP2 /etc/stunnel/stunnel.conf
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart

# Install Fail2Ban
apt-get -y install fail2ban;
service fail2ban restart

# Install DDOS Deflate
cd
apt-get -y install dnsutils dsniff
wget https://github.com/Dreyannz/Deb7AutoScriptVPS/raw/master/ddos-deflate-master.zip
unzip ddos-deflate-master.zip
cd ddos-deflate-master
./install.sh
rm -rf /root/ddos-deflate-master.zip

# Banner
rm /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/issue.net"
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
service ssh restart
service dropbear restart

# XML Parser
cd
apt-get -y --force-yes -f install libxml-parser-perl

# Install Screenfetch
apt-get -y install lsb-release scrot
wget -O screenfetch 'https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/screenfetch'
chmod +x screenfetch

# SSH brute-force protection
iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --set 
iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 10 -j DROP  

# Protection against port scanning
iptables -N port-scanning 
iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN 
iptables -A port-scanning -j DROP

# First Level Block Torrent
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP
iptables -A OUTPUT -p udp --dport 1024:65534 -j DROP
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP

# Second Level Block Torrent
iptables -A INPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A INPUT -m string --algo bm --string "peer_id=" -j REJECT
iptables -A INPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A INPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "info_hash" -j REJECT
iptables -A INPUT -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A INPUT -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A INPUT -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A INPUT -m string --string "peer_id" --algo kmp -j REJECT
iptables -A INPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A INPUT -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A INPUT -m string --string "find_node" --algo kmp -j REJECT
iptables -A INPUT -m string --string "info_hash" --algo kmp -j REJECT
iptables -A INPUT -m string --string "get_peers" --algo kmp -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".torrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A FORWARD -m string --algo bm --string "torrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "info_hash" -j REJECT
iptables -A FORWARD -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A FORWARD -m string --string "peer_id" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "find_node" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "info_hash" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "get_peers" --algo kmp -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "peer_id=" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "announce.php?passkey=" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "info_hash" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "/default.ida?" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".exe?/c+dir" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".exe?/c_tftp" -j REJECT
iptables -A OUTPUT -m string --string "peer_id" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "announce.php?passkey=" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "find_node" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "info_hash" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "get_peers" --algo kmp -j REJECT
iptables -A INPUT -p tcp --dport 25 -j REJECT   
iptables -A FORWARD -p tcp --dport 25 -j REJECT 
iptables -A OUTPUT -p tcp --dport 25 -j REJECT 

# Download Script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/menu.sh"
wget -O add "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/trial.sh"
wget -O remove "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/hapus.sh"
wget -O check "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/user-login.sh"
wget -O member "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/user-list.sh"
wget -O delexp "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/delexp.sh"
wget -O clearcache "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/clearcache.sh"
wget -O banner "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/servermessage.sh"
wget -O restart "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/resvis.sh"
wget -O speedtest "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/info.sh"
wget -O about "https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/about.sh"

# AutoReboot Tools
echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "*/50 * * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "*/50 * * * * root service ssh restart" >> /etc/cron.d/dropbear
echo "0 1 * * * root ./delexp" > /etc/cron.d/delexp
echo "*/2 * * * * root ./clearcache" > /etc/cron.d/clearcache

# Set Permissions
chmod +x menu
chmod +x add
chmod +x trial
chmod +x remove
chmod +x check
chmod +x member
chmod +x delexp
chmod +x clearcache
chmod +x banner
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about

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
rm -f /root/Deb7_AutoScript_VPS.sh
rm -f /root/pass.txt
echo "unset HISTFILE" >> /etc/profile

# Info
clear
echo -e ""
echo -e "\e[94m##################################################"
echo -e "\e[94m         Deb7AutoScriptVPS by _Dreyannz_          "
echo -e "\e[94m                                                  "
echo -e "\e[94m                    Services                      "
echo -e "\e[94m                                                  "
echo -e "\e[94m    OpenSSH        :   22, 143                    "
echo -e "\e[94m    Dropbear       :   80, 443                    "
echo -e "\e[94m    SSL            :   442                        "
echo -e "\e[94m    Squid3         :   3128, 8000, 8080           "
echo -e "\e[94m    OpenVPN        :   TCP 1194                   "
echo -e "\e[94m    BadVPN         :   UDPGW 7300                 "
echo -e "\e[94m    Nginx          :   80                         "
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
echo -e "\e[94m##################################################"
echo -e "\e[0m                                                  "
read -n1 -r -p "          Press Any Key To Show Commands          "
menu
cd

