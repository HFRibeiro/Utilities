#!/bin/bash
sudo apt update
sudo apt install xserver-xorg-core
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer
sudo apt install ubuntu-gnome-desktop
sudo systemctl start gdm
sudo systemctl enable gdm
vncserver
vncserver -kill :*
touch ~/.vnc/xstartup
echo '#!/bin/sh 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session &' | tee ~/.vnc/xstartup
echo '[Unit]
Description=VNC Server by TeknoTut
After=syslog.target network.target

[Service]
Type=forking
User='$USER'

# Clean any existing files in /tmp/.X11-unix environment
ExecStartPre=/usr/bin/vncserver -kill :%i > /dev/null 2>&1 || :
ExecStart=/usr/bin/vncserver -geometry 800x600 -depth 24 -localhost no :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/vncserver@.service
sudo systemctl enable vncserver@1
sudo systemctl start vncserver@1
