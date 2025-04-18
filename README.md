# The Reality

### -[ Update And Upgrade ]
```bash
sudo apt update && sudo apt full-upgrade -y
sudo timedatectl set-timezone UTC
[ -f /var/run/reboot-required ] && echo "Reboot needed!" && sudo reboot
```

### -[ Install Essentials ]
```bash
sudo apt install -y curl htop nano wget unzip socat cron ufw git net-tools
```

### -[ Enable BBR (Modern Kernels) ]
```bash
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### -[ Fix DNS (Preserve Systemd) ]
```bash
sudo sed -i 's/#DNS=/DNS=8.8.8.8 1.1.1.1/' /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
```

### -[ Change SSH Port ]
```bash
NEW_PORT=2222
sudo sed -i "s/#Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
sudo ufw allow $NEW_PORT/tcp
sudo systemctl restart sshd
```

### -[ Install 3X-UI ]
```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```

### -[ Install HIDDIFY (Choose One) ]
```bash
# Stable
bash <(curl -Ls https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh)

# Beta
bash <(curl -Ls https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh) --beta

# Dev
bash <(curl -Ls https://raw.githubusercontent.com/hiddify/hiddify-config/main/install.sh) --dev
```

### -[ Auto Reboot ]
```bash
(crontab -l 2>/dev/null; echo "0 7 * * * /sbin/shutdown -r +5") | crontab -
```

### -[ Fix Ubuntu 24.04 Repos ]
```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://archive.ubuntu.com/ubuntu noble main universe
deb http://archive.ubuntu.com/ubuntu noble-updates main universe
deb http://security.ubuntu.com/ubuntu noble-security main universe" | sudo tee /etc/apt/sources.list
sudo apt update
```

### -[ Install Xray Core ]
```bash
sudo bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
```

### -[ Get Geo Files ]
```bash
sudo wget -O /usr/local/share/xray/iran.dat https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/iran.dat
sudo wget -O /usr/local/share/xray/dlc.dat https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat
```

### -[ Generate Keys ]
```bash
echo "=== X25519 ===" > keys.txt
xray x25519 >> keys.txt
echo -e "\n=== UUID ===" >> keys.txt
xray uuid >> keys.txt
echo -e "\n=== Random ===" >> keys.txt
openssl rand -hex 8 >> keys.txt
cat keys.txt
```

### -[ Restart Xray ]
```bash
sudo systemctl restart xray
sudo systemctl status xray
```
