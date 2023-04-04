#!/bin/bash

# Update the system
sudo apt update && sudo apt upgrade -y

# Install Apache
sudo apt install -y apache2

# Enable Apache to start automatically on boot
sudo systemctl enable apache2

# Install PHP
sudo apt install -y php libapache2-mod-php

# Install MariaDB
sudo apt install -y mariadb-server

# Secure the MariaDB installation
sudo mysql_secure_installation

# Install PHP modules
sudo apt install -y php-mysql php-gd php-mbstring php-xml php-curl

# Install phpMyAdmin
sudo apt install -y phpmyadmin

# Enable the phpMyAdmin Apache configuration
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin

# Restart Apache to apply the changes
sudo systemctl restart apache2

echo "LAMP stack with phpMyAdmin has been installed. Access it at http://your_raspberry_pi_IP_address/phpmyadmin"
