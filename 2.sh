#!/bin/bash
yum install -y epel-release
yum install -y puppet
service puppet start
puppet apply -e 'include final' --modulepath=/vagrant --debug
echo -e 'DNS1="192.168.56.140"\nDNS2="10.0.2.3"\nPEERDNS="no"' >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo -e 'DNS1="192.168.55.140"\nDNS2="10.0.2.3"\nPEERDNS="no"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
service network restart
#puppet agent --test