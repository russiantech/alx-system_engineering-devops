# fixng bad `phpp` ext to `php` in this wp file `wp-settings.php`.

exec { 'fixing-wordress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
