#!/bin/bash

# WiFi credentials
SSID="ByteMe"
PSK="11dbmtpI"
INTERFACE="wlan0"
STATIC_IP="192.168.0.8/24"
GATEWAY="192.168.0.1"
DNS1="8.8.8.8"
DNS2="8.8.4.4"

# Function to install iwd if it is not installed
install_iwd() {
    if ! command -v iwd &> /dev/null; then
        echo "iwd not found. Installing iwd..."
        sudo apt-get update
        sudo apt-get install -y iwd
    else
        echo "iwd is already installed."
    fi
}

# Install iwd if necessary
install_iwd

# Start iwd service
sudo systemctl start iwd

# Connect to WiFi network using iwd
sudo iwctl --passphrase $PSK station $INTERFACE connect $SSID

# Bring the interface up
sudo ip link set $INTERFACE up

# Assign static IP address
sudo ip addr add $STATIC_IP dev $INTERFACE

# Add default gateway
sudo ip route add default via $GATEWAY

# Configure DNS
echo -e "nameserver $DNS1\nnameserver $DNS2" | sudo tee /etc/resolv.conf > /dev/null

# Verify connection
if ping -c 4 google.com &> /dev/null; then
    echo "Successfully connected to $SSID with IP $STATIC_IP"
else
    echo "Failed to connect to $SSID"
fi
