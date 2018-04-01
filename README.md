# Deb7AutoScriptVPS

Deb7AutoScriptVPS is made by _Dreyannz_ to minimize the time consumed and user involvement in setting up your VPS

## Services Included in Deb7AutoScriptVPS

* OpenSSH
* Dropbear
* SSL
* Squid3
* OpenVPN
* BadVPN
* WebMin
* Nginx
* Fail2Ban

## Script Commands in Deb7AutoScriptVPS

* menu       (Show Commands)
* add        (Create User Account)
* trial      (Create Trial Account)
* remove     (Remove User Account)
* check      (Check User Login)
* member     (Check Member)
* banner     (Configure Server Message)
* restart    (Restart Service Dropbear, Webmin,
              Squid3, Openvpn and SSH)
* reboot     (Reboot VPS)
* speedtest  (Speedtest VPS)
* info       (System Information)
* about      (Debian AutoScript VPS Info)

### How to Use the Deb7AutoScriptVPS

All you need to do is Copy and Paste the commands posted below to the console/terminal of your VPS

### Commands

```
wget https://raw.githubusercontent.com/Dreyannz/Deb7AutoScriptVPS/master/Deb7_AutoScript_VPS
```
```
chmod +x Deb7_AutoScript_VPS
```
```
./Deb7_AutoScript_VPS
```

### FIX on Error: The certificate of `raw.githubusercontent.com' is not trusted.
```
sudo apt-get install ca-certificates
```
