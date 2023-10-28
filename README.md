# The Reality

### -[ Update And Upgrade]
```bash
apt update && apt upgrade -y && sleep 10 && sudo timedatectl set-timezone Asia/Tehran && reboot
```
```bash
apt install -y curl htop nano wget unzip nano socat cron ufw git
```
```bash
rm /etc/sysctl.conf
echo "net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
vm.swappiness = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 212992 16777216
net.ipv4.tcp_wmem = 4096 212992 16777216" >> /etc/sysctl.conf
sysctl -p
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
sudo apt update&&sudo apt install -y curl&& sudo bash -c "$(curl -Lfo- https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh)"
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
