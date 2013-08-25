# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision :shell,
          :inline => "sed -i 's/us.archive.ubuntu.com/ch.archive.ubuntu.com/g' /etc/apt/sources.list"

  config.vm.define :controller do |controller_config|
    controller_config.vm.hostname = "controller"
    config.vm.provider :virtualbox do |vb|
    
      vb.customize ["modifyvm", :id, "--memory", "1200"]
      vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
    end
    controller_config.vm.network :private_network, ip: "10.0.10.10" # eth1 mgt
    controller_config.vm.network :private_network, ip: "192.168.10.10" # eth2 tenant api
  end

    config.vm.define :netnode do |netnode_config|
      netnode_config.vm.hostname = "netnode"
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
        vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
      end
      netnode_config.vm.network :private_network, ip: "10.0.10.11" # eth1 mgt
      netnode_config.vm.network :private_network, ip: "10.0.20.11" # eth1 vm traffic
      netnode_config.vm.network :private_network, ip: "192.168.101.101" # eth2 external net 
      netnode_config.vm.provision :shell, :inline => "ip link set mtu 1546 dev eth2"
    end

    config.vm.define :compute1 do |compute1_config|
      compute1_config.vm.hostname = "compute1"
        config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1024"]
          vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        end
        compute1_config.vm.network :private_network, ip: "10.0.10.12" # eth1 mgt
        compute1_config.vm.network :private_network, ip: "10.0.20.12" # eth1 vm traffic
        compute1_config.vm.provision :shell, :inline => "ip link set mtu 1546 dev eth2"
    end
end
