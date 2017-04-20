# Check puppet server and run class for installation agent or server
#
class final {
  if $::is_puppetmaster == 'true' {
    include final::pserver
  }
  elsif $::hostname == 'dns' {
    include final::dns
  }
  else {
    include final::node1
  }
}

