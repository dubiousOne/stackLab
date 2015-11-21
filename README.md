# stackLab

Tested on Ubuntu 14.04

## Setup:

* install latest vagrant

 ```bash
wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb
sudo dpkg -i vagrant_1.7.4_x86_64.deb
```
* install prerequisites for vagrant-libvirt provider

 ```bash
sudo apt-get install libxslt-dev libxml2-dev zlib1g-dev qemu-kvm libvirt-bin libvirt-dev ruby ruby-dev make
```

* add yourself to libvirtd group

 ```bash
sudo adduser $(whoami) libvirtd
```

* use correct linker

 ```bash
sudo ln -fs /usr/bin/ld.gold /usr/bin/ld
```

* install vagrant-libvirt plugin

 ```bash
vagrant plugin install vagrant-libvirt
```

* (optional) install additional vagrant plugins

 ```bash
vagrant plugin install vagrant-rekey-ssh
```

* add ubuntu64-libvirt.box to vagrant

 ```bash
vagrant box add https://atlas.hashicorp.com/naelyn/boxes/ubuntu-trusty64-libvirt
```

* install latest ansible (tested v1.9.4)

 ```bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

* add these to /etc/hosts

 ```bash
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
```

* generate ssh keypair *this needs to be fixed, directories are hardcoded!*

 ```bash
ssh-keygen -t rsa
```

* run setup.sh

 ```bash
./setup.sh
```
