#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    clear
    echo "You should run this script with root!"
    echo "Use sudo -i to change user to root"
    exit 1
fi

function main_menu {
    clear
    echo "---------- Iran ISP Blocker ----------"
    echo "https://github.com/Kiya6955/IR-ISP-Blocker"
    echo "--------------------------------------"
    echo "Allow only MTN (Irancell) ISP for a specific port"
    echo "--------------------------------------"
    read -p "Enter the port you want to allow for MTN: " port
    allow_mtn $port
}

function allow_mtn {
    local port=$1
    
    clear

    # Install iptables if not already installed
    if ! command -v iptables &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y iptables
    fi
    if ! dpkg -s iptables-persistent &> /dev/null; then
        sudo apt-get install -y iptables-persistent
    fi

    # Create chain if it doesn't exist
    if ! iptables -L isp-blocker -n >/dev/null 2>&1; then
        iptables -N isp-blocker
    fi

    # Link the chain to INPUT if not already linked
    if ! iptables -C INPUT -j isp-blocker &> /dev/null; then
        iptables -I INPUT 1 -j isp-blocker
    fi

    clear

    # Fetch the IP list for MTN from GitHub
    IP_LIST=$(curl -s 'https://raw.githubusercontent.com/Kiya6955/IR-ISP-Blocker/main/mtn-ips.ipv4')
    if [ $? -ne 0 ]; then
        echo "Failed to fetch the MTN IP list. Please contact @Kiya6955"
        read -p "Press enter to exit" dummy
        exit 1
    fi

    clear

    # Confirm action
    read -p "Are you sure you want to allow only MTN (Irancell) for port $port? [Y/N] : " confirm

    if [[ $confirm == [Yy]* ]]; then
        clear

        # Flush the existing isp-blocker rules
        sudo iptables -F isp-blocker

        echo "Blocking all IPs except MTN for port $port..."

        # Allow MTN IPs for the specified port
        for IP in $IP_LIST; do
            sudo iptables -A isp-blocker -s $IP -p tcp --dport $port -j ACCEPT
        done

        # Block all other IPs for the specified port
        sudo iptables -A isp-blocker -p tcp --dport $port -j DROP

        # Save the rules
        sudo iptables-save > /etc/iptables/rules.v4

        clear

        echo "Only MTN (Irancell) is allowed for port $port."
    else
        echo "Operation cancelled."
    fi

    read -p "Press enter to exit" dummy
}

# Start the script
main_menu
