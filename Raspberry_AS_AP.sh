#!/bin/bash
sudo apt-get update
sudo cp 90-persistent-net.rules /etc/udev/rules.d/90-persistent-net.rules
sudo apt-get install hostapd isc-dhcp-server
sudo apt-get install iptables-persistent
sudo cp dhcpd.conf /etc/dhcp/dhcpd.conf
sudo cp isc-dhcp-server /etc/default/isc-dhcp-server
sudo cp interfaces /etc/network/interfaces
sudo ifconfig wlan1 10.42.0.1
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo cp hostapd /etc/init.d/hostapd
sudo cp sysctl.conf /etc/sysctl.conf
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan1 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan1 -o eth0 -j ACCEPT
sudo sh -c "iptables-save > /etc/iptables/rules.v4"
sudo mv /usr/share/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service ~/
sudo service hostapd start
sudo service isc-dhcp-server start
sudo update-rc.d hostapd enable
sudo update-rc.d isc-dhcp-server enable
sudo reboot




