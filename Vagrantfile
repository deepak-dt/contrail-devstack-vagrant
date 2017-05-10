# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vagrant_config = YAML.load_file("provisioning/virtualbox.conf.yml")

Vagrant.configure(2) do |config|
  config.vm.box = vagrant_config['box']

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  # Bring up the Devstack controller node on Virtualbox
  config.vm.define "contrail_devstack_allinone" do |contrail_devstack_allinone|
    #contrail_devstack_allinone.vm.host_name = vagrant_config['contrail_devstack_allinone']['host_name']
    #contrail_devstack_allinone.vm.network "private_network", ip: vagrant_config['contrail_devstack_allinone']['ip']
    contrail_devstack_allinone.vm.provision :shell, path: "provisioning/setup-allinone.sh"

    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['contrail_devstack_allinone']['memory']
       vb.cpus = vagrant_config['contrail_devstack_allinone']['cpus']
	   vb.gui = true
    end
  end
  config.vm.synced_folder '.', '/vagrant'
end
