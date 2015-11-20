# Define our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = "naelyn/ubuntu-trusty64-libvirt"

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
  end

  # libvirt provider config
  config.vm.provider :libvirt do |libvirt|
    libvirt.nested = true
    # are these needed?
    # libvirt.host = ""
    # libvirt.uri = "qemu+unix:///system"
    # libvirt.driver = "kvm"
    # libvirt.connect_via_ssh = true
    # libvirt.username = "root"
  end

  # create mgmt node (OSAD deployment host)
  config.vm.define :mgmt do |mgmt_config|

    # set libvirt options
    mgmt_config.vm.provider :libvirt do |vm|
      vm.memory = 512
    end

    # configure mgmt vm
    mgmt_config.vm.box = BOX_NAME
    mgmt_config.vm.hostname = "mgmt"
    
    # (eth1) mgmt network
    mgmt_config.vm.network :private_network, :ip => "10.10.0.10" 

    # (eth2) container network
    mgmt_config.vm.network :private_network, :ip => "172.29.236.10"

    # (eth3) tunnel network
    mgmt_config.vm.network :private_network, :ip => "172.29.240.10"

    # (eth4) storage network
    mgmt_config.vm.network :private_network, :ip => "172.29.244.10"
  end

  # create (3) infrastructure nodes
  (1..3).each do |i|
    config.vm.define "infra#{i}" do |infra_config|

      # set libvirt options
      infra_config.vm.provider :libvirt do |vm|
        vm.memory = 2096
      end

      # configure infrastructure vms
      infra_config.vm.box = BOX_NAME
      infra_config.vm.hostname = "infra#{i}"

      # (eth1) mgmt network
      infra_config.vm.network :private_network, :ip => "10.10.0.2#{i}"
      infra_config.vm.network "forwarded_port", guest: 80, host: 8080

      # (eth2) container network
      infra_config.vm.network :private_network, :ip => "172.29.236.2#{i}"

      # (eth3) tunnel network
      infra_config.vm.network :private_network, :ip => "172.29.240.2#{i}"

      # (eth4) storage network
      infra_config.vm.network :private_network, :ip => "172.29.244.2#{i}"
    end
  end

  # create (1) compute node(s)
  (1..1).each do |i|
    config.vm.define "compute#{i}" do |compute_config|
    
      # set libvirt options
      compute_config.vm.provider :libvirt do |vm|
        vm.memory = 2096
      end

      # configure compute vm(s)
      compute_config.vm.box = BOX_NAME
      compute_config.vm.hostname = "compute#{i}"
      # (eth1) mgmt network
      compute_config.vm.network :private_network, :ip => "10.10.0.3#{i}"

      # (eth2) container network
      compute_config.vm.network :private_network, :ip => "172.29.236.3#{i}"

      # (eth3) tunnel network
      compute_config.vm.network :private_network, :ip => "172.29.240.3#{i}"

      # (eth4) storage network
      compute_config.vm.network :private_network, :ip => "172.29.244.3#{i}"
    end
  end

  # create (1) block storage node(s)
  (1..1).each do |i|
    config.vm.define "block#{i}" do |block_config|

      # set libvirt options
      block_config.vm.provider :libvirt do |vm|
        vm.memory = 1024
      end

      # configure block storage node(s)
      block_config.vm.box = BOX_NAME
      block_config.vm.hostname = "block#{i}"

      # (eth1) mgmt network
      block_config.vm.network :private_network, :ip => "10.10.0.4#{i}"

      # (eth2) container network
      block_config.vm.network :private_network, :ip => "172.29.236.4#{i}"

      # (eth3) tunnel network
      block_config.vm.network :private_network, :ip => "172.29.240.4#{i}"

      # (eth4) storage network
      block_config.vm.network :private_network, :ip => "172.29.244.4#{i}"
    end
  end

  # create logging node
  config.vm.define "logger" do |logger_config|

    # set libvirt options
    logger_config.vm.provider :libvirt do |vm|
      vm.memory = 512
    end

    # configure logging node
    logger_config.vm.box = BOX_NAME
    logger_config.vm.hostname = "logger"

    # (eth1) mgmt network
    logger_config.vm.network :private_network, :ip => "10.10.0.9"

    # (eth2) container network
    logger_config.vm.network :private_network, :ip => "172.29.236.9"

    # (eth3) tunnel network
    logger_config.vm.network :private_network, :ip => "172.29.240.9"

    # (eth4) storage network
    logger_config.vm.network :private_network, :ip => "172.29.244.9"
  end

  # create HAproxy node
  config.vm.define "proxy" do |proxy_config|

    # set libvirt options
    proxy_config.vm.provider :libvirt do |vm|
      vm.memory = 512
    end

    # configure HAproxy node
    proxy_config.vm.box = BOX_NAME
    proxy_config.vm.hostname = "proxy"

    # (eth1) mgmt network
    proxy_config.vm.network :private_network, :ip => "10.10.0.8"

    # (eth2) container network
    proxy_config.vm.network :private_network, :ip => "172.29.236.8"

    # (eth3) tunnel network
    proxy_config.vm.network :private_network, :ip => "172.29.240.8"

    # (eth4) storage network
    proxy_config.vm.network :private_network, :ip => "172.29.244.8"
  end
end
