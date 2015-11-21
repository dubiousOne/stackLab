# stackLab

Tested on Ubuntu 14.04

## Setup:

1. install latest vagrant
		wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb
		sudo dpkg -i vagrant_1.7.4_x86_64.deb

2. install prerequisites for vagrant-libvirt provider
		sudo apt-get install libxslt-dev libxml2-dev zlib1g-dev qemu-kvm libvirt-bin libvirt-dev ruby ruby-dev make

3. add yourself to libvirtd group
		sudo adduser $(whoami) libvirtd

4. use correct linker
		sudo ln -fs /usr/bin/ld.gold /usr/bin/ld

5. install vagrant-libvirt plugin
		vagrant plugin install vagrant-libvirt

6. (optional) install additional vagrant plugins
		vagrant plugin install vagrant-rekey-ssh

7. add ubuntu64-libvirt.box to vagrant
		vagrant box add https://atlas.hashicorp.com/naelyn/boxes/ubuntu-trusty64-libvirt

8. install latest ansible (tested v1.9.4)
		sudo apt-get install software-properties-common
		sudo apt-add-repository ppa:ansible/ansible
		sudo apt-get update
		sudo apt-get install ansible

9. add these to /etc/hosts
		# OSAD deployment node
		10.10.0.10 mgmt
		
		# OSAD infrastructure 
		10.10.0.8 proxy
		10.10.0.9 logger
		10.10.0.21 infra1
		10.10.0.22 infra2
		10.10.0.23 infra3
		10.10.0.31 compute1
		10.10.0.41 block1

10. generate ssh keypair *this needs to be fixed, directories are hardcoded!*
		ssh-keygen -t rsa

11. run setup.sh
		x./setup.sh
