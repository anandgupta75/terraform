#! /bin/bash

sudo apt-get update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#sudo apt-get install httpd -y
echo "hi its anand">/var/www/html/index.html
