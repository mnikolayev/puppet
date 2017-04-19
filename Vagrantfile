# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "pserver" do |pserver|
        pserver.vm.box = "centos/7"
        pserver.vm.hostname = "pserver"
        pserver.vm.network "private_network", ip: "192.168.56.150"
	
        pserver.vm.provider "virtualbox" do |machine|
		machine.cpus = 1		
		machine.memory = 4096
                machine.name = "master"
                end
	pserver.vm.provision "shell", path: "1.sh"
        end

	config.vm.define "node1" do |node1|
	node1.vm.box = "centos/7"
	node1.vm.hostname = "node1"
	node1.vm.network "private_network", ip: "192.168.56.155"
	
	node1.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 1024
		machine.name = "node1"
		end
	node1.vm.provision "shell", path: "1.sh"
        node1.vm.provision "shell", inline: "echo 192.168.56.150 pserver.minsk.epam.com puppet >> /etc/hosts"	
end

end
