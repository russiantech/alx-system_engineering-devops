#!/usr/bin/pup

# install specific flask version using puppet

package { 'flask':
 ensure   => '2.1.0',
 provider => 'pip3'
}
