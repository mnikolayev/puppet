# Class which install puppet-server
#
class final::pserver {

  exec { 'bash /vagrant/install.sh':
    command  => 'source /root/.bash_profile',
    provider => shell,
  }

  exec { 'root_bash_profile':
    command  => 'source /root/.bash_profile',
    provider => shell,
  }

  package { 'puppet-repo':
    ensure   => installed,
    provider => rpm,
    source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm'
  }

  package { 'puppetserver':
    ensure  => 'installed',
    require => Package['puppet-repo']
  }

  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    content => template('final/autosign.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    backup  => false,
  }

  service { 'puppetserver':
    ensure  => 'running',
    require => File['/etc/puppetlabs/puppet/autosign.conf'],
  }
}

