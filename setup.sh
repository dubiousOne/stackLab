#!/bin/sh

vagrant up

ansible-playbook ansible/ssh-keyscan.yml

echo "ansible all -m authorized_key -a \"user=vagrant key='{{ lookup('file', '/home/dubious/.ssh/id_rsa.pub') }}' state=present\" -k" | /bin/sh

ansible-playbook ansible/provision_stack.yml
