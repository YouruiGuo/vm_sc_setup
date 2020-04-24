#!/bin/bash

sudo apt-get install virtualbox
curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_linux_amd64.zip
mkdir test
unzip vagrant_2.2.6_linux_amd64.zip -d test
cp inline.sh ./test/
cp download.py ./test/
cp conf.xml ./test/
cd test
./vagrant -v
./vagrant init hashicorp/bionic64
cp ../Vagrantfile ./
./vagrant up

./vagrant reload
./vagrant ssh << EOF
	cp /vagrant/conf.xml /home/vagrant/.config/jack/conf.xml
	jack_control start
EOF


