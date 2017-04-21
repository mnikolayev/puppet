# Check puppet server and run class for installation agent or server
#
class final {
  $node1 = true
  $node2 = true
  $master = true
  $node3 = true 
  if $::is_puppetmaster == 'true' {
    include final::pserver
  }
  elsif $::hostname == 'dns' {
    include final::dns
  }
  else {
    include final::node1
  }
  include final::resolve
}