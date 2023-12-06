#!/usr/bin/env bash
# Puppet script (2-puppet_custom_http_response_header.pp)
# to configure a new Ubuntu machine with a custom HTTP header in Nginx

# Install Nginx
class { 'nginx':
  ensure => 'installed',
}

# Create a custom HTTP header file
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => present,
  content => "add_header X-Served-By $hostname;\n",
  notify  => Service['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => File['/etc/nginx/conf.d/custom_headers.conf'],
}
