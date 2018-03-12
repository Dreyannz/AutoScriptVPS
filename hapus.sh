#!/bin/bash
#Script to Remove Users on SSH and OpenVPN

clear
read -p "Username to be removed : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "User $Pengguna has been deleted successfully."
else
        echo -e "Error: User $Pengguna is not on the User list."
fi
