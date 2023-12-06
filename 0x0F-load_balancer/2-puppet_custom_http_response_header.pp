#!/usr/bin/env bash
# automate task 0 using nginx

# Install Nginx
class { 'nginx':
  ensure => 'installed',
}

# Create a custom HTTP header file
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => present,
  content => "# Custom HTTP header configuration\nadd_header X-Served-By $hostname;\n",
  notify  => Service['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => File['/etc/nginx/conf.d/custom_headers.conf'],
}

