#!/bin/bash

# Update package lists
yum update

# Insert install nginx 
yum install -y nginx 

# Configure Nginx to run on port 80
sed -i 's/listen\s*80;/listen 80 default_server;/g' /etc/nginx/sites-available/default

# Restart Nginx
systemctl restart nginx

echo "Nginx installed and running on port 80."

