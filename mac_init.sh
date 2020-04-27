#!/bin/bash

#sudo apt-get install virtualbox
if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)";
fi
brew cask install virtualbox
brew cask install vagrant
#curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_linux_amd64.zip
mkdir test
#unzip vagrant_2.2.6_linux_amd64.zip -d test
cp inline.sh ./test/
cp download.py ./test/
cp conf.xml ./test/
cd test
vagrant -v
vagrant init hashicorp/bionic64
cp ../Vagrantfile ./
vagrant up

vagrant reload

vagrant ssh << EOF
	jack_control start
	cd /home/vagrant
	#echo `aplay -L | grep CARD= -m1 | cut -d'=' -f 2`
	echo -e '#!/bin/bash\njack_control stop\njack_control ds alsa\njack_control dps device hw:\`aplay -L | grep CARD= -m1 | cut -d'=' -f 2\`\njack_control dps rate 48000\njack_control dps nperiods 2\njack_control dps period 1024\nsleep 2\njack_control start\n' >> /home/vagrant/start_jack.sh
	chmod u+x /home/vagrant/start_jack.sh

	#jack_control stop
	#echo '/home/vagrant/start_jack.sh' >> ~/.bashrc
	#cd /home/vagrant/.config/jack && cp /vagrant/conf.xml ./
	#jack_control start
EOF


