# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: David Manouchehri

Vagrant.configure("2") do |config|
	config.vm.box = "bento/ubuntu-16.04"

	config.vm.synced_folder ".", "/vagrant", disabled: true

	config.vm.provision "docker"

	config.vm.provision "file", source: "sshd_config", destination: "/tmp/sshd_config"
	config.vm.provision "file", source: "issue.net", destination: "/tmp/issue.net"

	config.vm.provision "shell", path: "setup.sh"

	%w(vmware_fusion vmware_workstation vmware_appcatalyst).each do |provider|
		config.vm.provider provider do |v|
			v.vmx['ethernet0.virtualDev'] = 'vmxnet3'
		end
	end

	config.vm.provider "virtualbox"
	config.vm.provider "hyperv"
end
