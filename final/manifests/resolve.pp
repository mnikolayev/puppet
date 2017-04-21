class final::resolve {

  exec { 'echo attr -i':
    command => '/usr/bin/chattr -i  /etc/resolv.conf ; /usr/bin/chattr -i  /etc/dnsmasq.conf',
  }->

  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('final/resolv.erb'),
    backup  => false,
    replace => true,
  }->

  file { '/etc/dnsmasq.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('final/dnsmasq.erb'),
    backup  => false,
    replace => true,
  }->

  exec { 'echo attr +i':
    command => '/usr/bin/chattr +i  /etc/resolv.conf ; /usr/bin/chattr +i  /etc/dnsmasq.conf',
  }->

  
/*  service { 'network':
    name    => 'restart',
    restart => 'true',
  }->*/
  
  service { 'dnsmasq':
    name    => 'restart',
    restart => 'true',  
  }

}