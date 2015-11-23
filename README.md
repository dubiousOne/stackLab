# stackLab

Tested on Ubuntu 14.04

### stuff to fix
+ change project root directory
+ fix hardcoded directories
+ add better host management
+ complete deployment automation (remove README steps)

## Setup:

1. install latest vagrant

 ```bash
wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb
sudo dpkg -i vagrant_1.7.4_x86_64.deb
```
1. install prerequisites for vagrant-libvirt provider

 ```bash
sudo apt-get install libxslt-dev libxml2-dev zlib1g-dev qemu-kvm libvirt-bin libvirt-dev ruby ruby-dev make
```

1. add yourself to libvirtd group

 ```bash
sudo adduser $(whoami) libvirtd
```

1. use correct linker

 ```bash
sudo ln -fs /usr/bin/ld.gold /usr/bin/ld
```

1. install vagrant-libvirt plugin

 ```bash
vagrant plugin install vagrant-libvirt
```

1. (optional) install additional vagrant plugins

 ```bash
vagrant plugin install vagrant-rekey-ssh
```

1. add ubuntu64-libvirt.box to vagrant

 ```bash
vagrant box add https://atlas.hashicorp.com/naelyn/boxes/ubuntu-trusty64-libvirt
```

1. install latest ansible (tested v1.9.4)

 ```bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

1. add these to /etc/hosts

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

1. generate ssh keypair *this needs to be fixed, directories are hardcoded!*

 ```bash
ssh-keygen -t rsa
```

1. run setup.sh

 ```bash
./setup.sh
```
