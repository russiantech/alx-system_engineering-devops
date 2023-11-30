#!/usr/bin/env bash
# 5. Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => installed,
}

# Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx main site
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Enable default site by creating a symbolic link
file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}

# Template for Nginx default site
file { '/etc/nginx/default.erb':
  ensure => present,
  content => 'server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /usr/share/nginx/html;
    index index.html index.htm;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
        add_header X-Served-By $hostname;
    }

    location /redirect_me {
        return 301 http://example.com;
    }

    error_page 404 /404.html;
    location = /404.html {
        internal;
    }

    location = /50x.html {
        internal;
    }
}
',
}
