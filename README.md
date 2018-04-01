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

* menu      &nbsp;&nbsp;&nbsp; (Show Commands)
* add       &nbsp;&nbsp;&nbsp; (Create User Account)
* trial  &nbsp;&nbsp;&nbsp;    (Create Trial Account)
* remove     &nbsp;&nbsp;&nbsp;&nbsp;(Remove User Account)
* check     &nbsp;&nbsp;&nbsp;&nbsp; (Check User Login)
* member    &nbsp;&nbsp;&nbsp;&nbsp; (Check Member)
* banner     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Configure Server Message)
* restart   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Restart Service Dropbear, Webmin, Squid3, Openvpn and SSH)
* reboot    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Reboot VPS)
* speedtest  &nbsp;&nbsp;&nbsp;&nbsp;(Speedtest VPS)
* info       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(System Information)
* about      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Debian AutoScript VPS Info)

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
