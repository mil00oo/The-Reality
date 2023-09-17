#!/bin/bash
cd /root


# Installing Python requirements
apt install screen pip -y &&
python3 -m pip install flask requests &&

# Download and extract Sing-Box Segaro Style XD
curl -Lo /root/sb https://github.com/SagerNet/sing-box/releases/download/v1.4.3/sing-box-1.4.3-linux-amd64.tar.gz &&
tar -xzf /root/sb &&
cp -f /root/sing-box-*/sing-box /root &&
rm -r /root/sb /root/sing-box-* &&
chown root:root /root/sing-box &&
chmod +x /root/sing-box

# Download Sing-Box configuration file
curl -Lo /root/sing-box_config.json https://raw.githubusercontent.com/mil00oo/The-Reality/main/Reality_checker/reality-singbox.json

# Download Sing-Box service file
curl -Lo /etc/systemd/system/sing-box.service https://raw.githubusercontent.com/mil00oo/The-Reality/main/Reality_checker/sing-box.service &&
systemctl daemon-reload

# Enable and start Sing-Box service
systemctl enable --now sing-box &&
sleep 0.2 &&
systemctl status sing-box &&
sleep 0.2 &&
systemctl restart --now sing-box &&
sleep 0.2 &&
systemctl status sing-box
clear
clear

curl -Lo /root/run_server.sh https://raw.githubusercontent.com/mil00oo/The-Reality/main/Reality_checker/run_server.sh &&
curl -Lo /root/server.py https://raw.githubusercontent.com/mil00oo/The-Reality/main/Reality_checker/server.py &&
sleep 1 &&
bash run_server.sh &&
echo "run 'screen -ls' to find all detached screen and use 'screen -r sid' to check if its working properly"
