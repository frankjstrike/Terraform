#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.html
