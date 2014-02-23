#!/bin/bash

# this is a crude script to get ansible installed on debian wheezy, without
# using jessie repos, and without trashing the rest of my system. 
# it then goes on to run a play book which installs some firmware
# than enables linux to use the wireless card on my Lenovo x230.

apt-get -y install cdbs debhelper dpkg-dev git-core reprepro python-apt
apt-get -y install python-jinja2 python-yaml python-paramiko sshpass
apt-get -f install
apt-get -y install python-jinja2 python-yaml python-paramiko sshpass

mkdir ~/build
cd ~/build
git clone git://github.com/ansible/ansible.git
make deb
cd ..
dpkg -i ansible*.deb

mkdir ~/config
cd ~/config
git clone https://github.com/bobdung/ansible
cd ansible
ansible-playbook -i inventory x230.yml -c local 
