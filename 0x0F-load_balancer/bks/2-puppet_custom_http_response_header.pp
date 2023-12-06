# Automation: creates a custom HTTP header response with Puppet.

# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP header response
file_line { 'custom_http_header':
  path   => '/etc/nginx/sites-available/default',
  line   => '    add_header X-Served-By $hostname;',
  match  => '^[\s]*add_header X-Served-By.*',
  after  => '^[\s]*server_name.*',
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File_line['custom_http_header'],
}
