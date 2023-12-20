#!/usr/bin/env bash
# Install MySQL on web-01 and web-02 servers

# Update package index
sudo apt-get update

# Install MySQL server (5.7.x)
sudo apt-get install -y mysql-server-5.7

# Check MySQL version
mysql --version
