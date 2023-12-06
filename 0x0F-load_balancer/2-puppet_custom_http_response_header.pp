exec { 'configure_custom_header':
  command  => "apt-get -y update && apt-get -y install nginx && sed -i '/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;' /etc/nginx/sites-available/default && service nginx restart",
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin:/sbin',
  unless   => 'grep -q "add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  require  => Package['nginx'],
}
