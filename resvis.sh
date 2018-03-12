#!/bin/bash
# Script restart service dropbear, webmin, squid3, openvpn, openssh
# Created by Bustami Arifin
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
service dropbear restart
service webmin restart
service squid3 restart
service openvpn restart
service ssh restart
