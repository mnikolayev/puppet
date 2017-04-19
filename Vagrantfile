# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "pserver" do |pserver|
        pserver.vm.box = "centos/7"
        pserver.vm.hostname = "pserver.lab2.local"
        pserver.vm.network "private_network", ip: "192.168.56.150"
        pserver.vm.provider "virtualbox" do |machine|
                machine.cpus = 1        
                machine.memory = 4096
                machine.name = "master"
                end
    pserver.vm.provision "shell", path: "1.sh"
        end

    config.vm.define "dns" do |dns|
        dns.vm.box = "centos/7"
        dns.vm.hostname = "dns.lab1.local"
        dns.vm.network "private_network", ip: "192.168.56.140"
        dns.vm.network "private_network", ip: "192.168.55.140"
        dns.vm.provider "virtualbox" do |machine|
        machine.cpus = 1        
        machine.memory = 1024
                machine.name = "dns"
                end
    dns.vm.provision "shell", path: "2.sh"
        end

    config.vm.define "node1" do |node1|
    node1.vm.box = "centos/7"
    node1.vm.hostname = "node1.lab1.local"
    node1.vm.network "private_network", ip: "192.168.55.155"
    node1.vm.provider "virtualbox" do |machine| 
        machine.cpus = 1
        machine.memory = 1024
        machine.name = "node1"
        end
    node1.vm.provision "shell", path: "1.sh"
    #node1.vm.provision "shell", inline: "echo 192.168.56.150 pserver.minsk.epam.com puppet >> /etc/hosts"
    end

    config.vm.define "node2" do |node2|
    node2.vm.box = "centos/7"
    node2.vm.hostname = "node2.lab2.local"
    node2.vm.network "private_network", ip: "192.168.56.156"
    node2.vm.provider "virtualbox" do |machine| 
        machine.cpus = 1
        machine.memory = 1024
        machine.name = "node2"
        end

    node2.vm.provision "shell", path: "1.sh"
    #node2.vm.provision "shell", inline: "echo 192.168.56.150 pserver.minsk.epam.com puppet >> /etc/hosts"

    end



end
