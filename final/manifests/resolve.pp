class final::resolve {

  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('final/resolv.erb'),
    backup  => false,
    replace => true,
  }->

  exec { 'echo attr':
    command => '/usr/bin/chattr +i  /etc/resolv.conf',
  }
  
  service { 'network restart':
    name    => 'restart',
    restart => 'true',
  }
}