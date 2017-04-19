class final::dns {

  $hotfix_files = [
    '/var/named/forward.lab1',
    '/var/named/forward.lab2',
    '/var/named/reverse.lab1',
    '/var/named/reverse.lab2',
    '/etc/named.conf',
  ]


  exec { 'root_bash_profile':
    command  => 'source /root/.bash_profile',
    provider => shell,
  }


  package { 'bind':
    ensure   => 'installed',
  }


  package { 'bind-utils':
    ensure  => 'installed',
    require => Package['bind'],
    notify => Service['puppetserver'],
    subscribe => [
    File[$hotfix_files],
    ]
  }


  file { '/var/named/forward.lab1':
    ensure  => file,
    content => template('final/forwardlab1.erb'),
    owner   => root,
    group   => wheel,
    mode    => '0644',
    backup  => false,
  }


  file { '/var/named/forward.lab2':
    ensure  => file,
    content => template('final/forwardlab2.erb'),
    owner   => root,
    group   => wheel,
    mode    => '0644',
    backup  => false,
  }


  file { '/var/named/reverse.lab1':
    ensure  => file,
    content => template('final/reverselab1.erb'),
    owner   => root,
    group   => wheel,
    mode    => '0644',
    backup  => false,
  }


  file { '/var/named/reverse.lab2':
    ensure  => file,
    content => template('final/reverselab2.erb'),
    owner   => root,
    group   => wheel,
    mode    => '0644',
    backup  => false,
  }


  file { '/etc/named.conf':
    ensure  => file,
    content => template('final/namedconf.erb'),
    owner   => root,
    group   => wheel,
    mode    => '0644',
    backup  => false,
  }


  exec { 'chgrp named -R /var/named ; chown -v root:named /etc/named.conf ; restorecon -rv /var/named ; restorecon /etc/named.conf':
     command      => '/bin/bash',
  }


  service { 'named':
    ensure  => 'running',
    restart => 'true',
    enable => 'true',
    require => File['/etc/named.conf'],
  }


  service { 'network':
    ensure  => 'running',
    restart => 'true',
    enable => 'true',
    require => File['/etc/named.conf'],
  }


  service { 'puppetserver':
    ensure  => 'running',
  }
}