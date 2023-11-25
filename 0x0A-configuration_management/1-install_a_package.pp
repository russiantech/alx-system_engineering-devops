#!/usr/bin/pup

# Install Python 3.8.10
package { 'python3.8':
  ensure => '3.8.10',
}

# Install Flask 2.1.0 using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# Install Werkzeug 2.1.1 using pip3
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}

