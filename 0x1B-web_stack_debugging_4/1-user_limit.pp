# Allow holberton user login and open files without error.

# Increase hard file limit for Holberton.
exec { 'hard-file-limit-increase':
  command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# Increase soft file limit for Holberton.
exec { 'soft-file-limit-increase':
  command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
