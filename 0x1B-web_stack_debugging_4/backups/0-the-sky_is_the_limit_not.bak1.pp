# Increase how many traffic an nginx server can handle
# By Increasing the ULIMIT

# Modify the ULIMIT value
exec { 'modify the ulimit value':
    command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
    path    => '/usr/local/bin/:/bin/'
}

# Restart nginx
service { 'nginx': 
	command => '/etc/init.d/nginx restart',
	path => '/etc/init.d/'
}
