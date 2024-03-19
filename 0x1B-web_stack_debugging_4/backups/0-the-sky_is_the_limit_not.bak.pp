# Increase how many traffic an nginx server can handle

# By Increasing the ULIMIT

exec {
    # Modify the ULIMIT value
    command => '/bin/sed -i "s/15/4096/" /etc/defaut/nginx'
    #set path sed command
    path => '/usr/local/bin/:bin/',
}

# Restart nginx
exec {
    # restart nginx as service
    command => '/etc/init.d/nginx restart',
    # set path for init.d scripts
    path => '/etc/init.d/',
}
