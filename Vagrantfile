# -*- mode: ruby -*-
# # vi: set ft=ruby :
 
# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
 
# Require YAML module
require 'yaml'
 
# Read YAML file with box details
servers = YAML.load_file('servers_config.yaml')
 
# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = "siddheshbhandarkar/MSKSidCentos7"
	  
	  config.vm.hostname = "elkhost"
      srv.vm.provision :shell, path: "./scripts/install_elk.sh"
	  srv.vm.provision :"shell", inline: "sudo ifup enp0s8", privileged: true
	  
      if servers["network_type"] == "public"
	      srv.vm.network "public_network" 
      elsif servers["network_type"] == "private"
          srv.vm.network "private_network", ip: servers["ip"]
      else
          raise 'An error has occuered. The value of network type should be either private or public'
      end
	  srv.vm.provider :virtualbox do |vb|
         vb.name = servers["name"]
         vb.memory = servers["ram"]
      end
    end
  end
end
