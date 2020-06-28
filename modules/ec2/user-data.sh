#!/bin/bash
yum install httpd -y
echo "Hi from ${environment} to ${db_address}" >> /var/www/html/index.html
systemctl start httpd