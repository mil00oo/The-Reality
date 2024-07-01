# The Reality

### -[ Update And Upgrade]
```bash
apt update && apt upgrade -y && sleep 10 && sudo timedatectl set-timezone UTC && reboot
```
```bash
apt install -y curl htop nano wget unzip nano socat cron ufw git
```
```bash
wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && bash bbr.sh
```
### -[ Change SSH port ]
```bash
apt install net-tools && netstat -tulnp
```
```bash
nano /etc/ssh/sshd_config
```
```bash
systemctl restart sshd
```
### -[ Install 3X-UI]
```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```
### -[ Install HIDDIFY]
```bash
bash <(curl i.hiddify.com/release)
```
```bash
bash <(curl i.hiddify.com/beta)
```
```bash
bash <(curl i.hiddify.com/dev)
```
### -[ Crontab]
```bash
crontab -e
```
```bash
0 7   *   *   *    /sbin/shutdown -r +5
```
### -[ Change Repository]
```bash
rm /etc/apt/sources.list
echo "deb http://mirror-cdn.xtom.com/ubuntu focal main universe
deb http://mirror-cdn.xtom.com/ubuntu focal-updates main universe
deb http://mirror-cdn.xtom.com/ubuntu focal-security main universe" >> /etc/apt/sources.list
```
### -[ Install Xray Core]
```bash
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --beta -u root
```
### -[download dlc.dat file]

```bash
cd /usr/local/share/xray/ && wget https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/iran.dat && wget https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat && cd
```

### -[ Public and Private Keys ]
```bash
xray x25519
```
```bash
xray uuid
```
```bash
openssl rand -hex 8
```
### -[ Change config.json of Xray ]
```bash
nano /usr/local/etc/xray/config.json
```
```bash
systemctl restart xray.service && sleep 2 && systemctl status xray.service
```
