# Kill killmenow process

exec { 'pkill_killmenow':
  command  => 'pkill -f killmenow',
  provider => 'shell',
  onlyif   => 'pgrep -f killmenow',
}
