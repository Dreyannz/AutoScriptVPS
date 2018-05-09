#!/bin/bash

# current time in seconds
datenow=$(date +%s)

# loop over all users
for user in $(awk -F: '{print $1}' /etc/passwd); do

# get date of expiration of users that have exp. date set
expdate=$(chage -l $user|awk -F: '/Account expires/{print $2}')
echo $expdate|grep -q never && continue
echo -n "User \`$user' expires on $expdate ... "

# convert exp. date to seconds
expsec=$(date +%s --date="$expdate")

# calculate diff b/t time now and exp. date
diff=$(echo $datenow - $expsec|bc -l)

# if a negative number, hasn't expired yet
echo $diff|grep -q ^\- && echo okay && continue

# got this far, account must have expired
echo deleting...
userdel -r $user
done
clear
echo -e "                                                        "
echo -e "\e[94m   :::::::::  :::::::::: :::::::::  :::::::::::   "
echo -e "\e[94m   :+:    :+: :+:        :+:    :+: :+:     :+:   "
echo -e "\e[94m   +:+    +:+ +:+        +:+    +:+        +:+    "
echo -e "\e[94m   #+     +:+ +#++:++#   +#++:++#+        +#+     "
echo -e "\e[94m   +#+    +#+ +#+        +#+    +#+      +#+      "
echo -e "\e[94m   #+#    #+# #+#        #+#    #+#     #+#       "
echo -e "\e[94m   #########  ########## #########      ###       "
echo -e "\e[94m         Deb7AutoScriptVPS by _Dreyannz_          "
echo -e "\e[0m"
echo -e "\e[94m       All Expired Users Has Been Deleted         "
echo -e "\e[0m"

