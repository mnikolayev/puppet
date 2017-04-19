# Class install node1
#
class final::node1 ($version_agent = 'latest' ) {

  package { 'puppet-repo':
    ensure   => installed,
    provider => rpm,
    source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm'
  }

  package { 'puppet-agent':
    ensure  => $version_agent,
    require => Package['puppet-repo'],
  }

  service { 'puppet':
    ensure  => 'running',
    require => Package['puppet-agent'],
  }
}

