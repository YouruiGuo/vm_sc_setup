#!/bin/bash

sudo apt-get update
sudo sed -i 's/allowed_users=.*/allowed_users=anybody/' /etc/X11/Xwrapper.config
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
echo "xfce4 installed"
sudo apt-get install -yq lightdm lightdm-gtk-greeter

sudo VBoxClient --clipboard
sudo VBoxClient --draganddrop
sudo VBoxClient --display
sudo VBoxClient --checkhostversion
sudo VBoxClient --seamless

sudo apt-get -yq install python2.7 python-pip unzip alsa-base alsa-utils git
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential libsndfile1-dev libasound2-dev libavahi-client-dev libicu-dev libreadline6-dev libfftw3-dev libxt-dev libudev-dev pkg-config git cmake qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtpositioning5-dev libqt5sensors5-dev libqt5opengl5-dev qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install libjack-jackd2-dev
pip install pynput keyboard numpy pyOSC gdown


cd /home/vagrant && git clone https://github.com/YouruiGuo/soundscape_experiment.git
cd /home/vagrant/soundscape_experiment && cp /vagrant/download.py ./ && sudo python download.py
mkdir /home/vagrant/soundscape_experiment/audio && sudo unzip audio.zip -d /home/vagrant/soundscape_experiment/audio

#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FABAEF95

sudo add-apt-repository -y ppa:supercollider/ppa
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install supercollider supercollider-ide supercollider-server supercollider-dev 

echo -e 'pcm.!default {\n  type plug\n  slave.pcm "hw:0,1"\n}' | sudo tee >/dev/null /etc/asound.conf
sudo modprobe snd
sudo modprobe snd-hda-intel
sleep 2
sudo amixer -c 0 set Master playback 100% unmute

echo -e '@audio - rtprio 99\n@audio - memlock unlimited\n@audio - nice -10' | sudo tee -a /etc/security/limits.conf
echo -e '@audio - rtprio 99\n@audio - memlock unlimited\n@audio - nice -10' | sudo tee -a /etc/security/limits.d/audio.conf
echo -e 'load-module module-jack-sink channels=2\nload-module module-jack-source channels=2\nset-default-sink jack_out' | sudo tee -a /etc/pulse/default.pa

sudo sed -i 's/; autospawn = yes/autospawn = no/g' /etc/pulse/client.conf

groupadd audio
sudo usermod -a -G audio vagrant
sudo alsa force-reload
alsactl init
#sudo alsactl restore
#sudo startxfce4&
