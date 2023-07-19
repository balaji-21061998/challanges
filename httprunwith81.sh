#!/bin/bash
# Update package lists
yum update -y
# Install httpd (Apache HTTP Server)
yum install -y httpd
# Configure httpd to run on port 81
sed -i 's/Listen\s*80/Listen 81/g' /etc/httpd/conf/httpd.conf
# Start httpd service
systemctl start httpd
# Enable httpd to start on system boot
systemctl enable httpd
# Check if httpd is running on port 81
netstat -tuln | grep ":81"
# Print httpd status
systemctl status httpd

