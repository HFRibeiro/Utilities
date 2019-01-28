#!/bin/bash
sudo apt-get update
echo "Install Apache2"
sudo apt-get -y install apache2
sudo apt-get -y install libcurl
sudo apt-get -y install php7.0-curl
echo "Install mysql-server mysql-client"
sudo apt-get -y install mysql-server mysql-client
echo "Install phpmyadmin"
sudo apt-get -y install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html
sudo cp apache2.conf /etc/apache2/
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf
sudo service apache2 reload
sudo apt-get -y install xrdp
sudo chmod 777 /var/www/html
sudo apt-get -y install vsftpd
sudo cp vsftpd.conf /etc/
sudo service vsftpd restart
sudo apt-get -y install openssh-server

echo "Finish Sucess!"
sudo reboot
