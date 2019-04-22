sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dnsmasq hostapd
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd
sudo reboot
sudo nano /etc/dhcpcd.conf

```
interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
```

sudo service dhcpcd restart
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
sudo nano /etc/dnsmasq.conf

```
interface=wlan0      # Use the require wireless interface - usually wlan0
  dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
```

sudo nano /etc/hostapd/hostapd.conf

```
interface=wlan0
driver=nl80211
ssid=Birdtud
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=birdtud01
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
```

sudo nano /etc/default/hostapd

```
DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
sudo systemctl start dnsmasq

sudo nano /etc/sysctl.conf

 ```
 net.ipv4.ip_forward=1
 ```
 
 sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
 sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
 sudo nano /etc/rc.local
 
  ```
 iptables-restore < /etc/iptables.ipv4.nat
  ```
 
 
