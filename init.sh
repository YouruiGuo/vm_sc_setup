#!/bin/bash

sudo apt-get install virtualbox
curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_linux_amd64.zip
mkdir test
unzip vagrant_2.2.6_linux_amd64.zip -d test
cp inline.sh ./test/
cp download.py ./test/
cd test
./vagrant -v
./vagrant init hashicorp/bionic64
cp ../Vagrantfile ./
#sed -i '16i  config.ssh.forward_x11 = true # useful since some audio testing programs use x11\n config.vm.provision :shell, path: "inline.sh"\n  config.vm.provider "virtualbox" do |vb|\nvb.gui = true\n vb.customize ["modifyvm", :id, "--audio", "alsa", "--audiocontroller", "hda", ]\nend\n ' Vagrantfile
./vagrant up

./vagrant reload
./vagrant ssh << EOF
	jack_control start
EOF


