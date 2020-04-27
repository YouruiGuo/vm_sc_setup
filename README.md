# README
## Clone

- Clone this repo to your local machine using `https://github.com/YouruiGuo/vm_sc_setup.git`
```shell
$ git clone https://github.com/YouruiGuo/vm_sc_setup.git
$ cd vm_sc_setup
```

## Setup

- Run the script init.sh. For mac,
```shell
$ chmod u+x mac_init.sh
$ ./mac_init.sh
```
For linux,
```shell
$ chmod u+x init.sh
$ ./init.sh
```

- After the VM is rebooted, you can login with the password vagrant.
- Open the terminal and:
```shell
$ ./start_jack.sh
```
- Launch supercollider and the path of the SC file is ~/soundscape_experiment/play2.scd.
- Put the cursor at the first line and execute it using ctrl+enter, then move the cursor to the next line and execute it with ctrl+enter.
- Go to the terminal and:

```shell
$ cd ~/soundscape_experiment
$ python runner.py
```

## Q&A
**No sound when running the code:**
- Go to the setting of Virtualbox machine, enable audio output under audio tab. Then, reboot the virtual box. 
```shell
$ cd test
$ vagrant reload
```

**Unable to boot the server in supercollider:**
- Open terminal and type:
```shell
$ ps aux | grep jack
```
- If there are more than one processes running jack, kill all processes and restart jack server:
```shell
$ kill -9 #proc
$ jack_control start
```
- If it is still not working, check the log of jack server:
```shell
$ cat ~/.log/jack/jackdbus.log
```
**Hearing intermittent sound after running supercollider:**
- Modify the file ~/start_jack.sh and change the frames per periods to a smaller number such as 1024 or 512.
```
jack_control dps period 1024
```
- Go to the terminal and:
```shell
$ cd ~
$ ./start_jack.sh
```
**Keep receiving errors when running start_jack.sh**
- Make sure that all jack processes are killed, and then open qjackctl.
```shell
$ qjackctl
```
- Go to the setup, change the interface from default to an available audio device, then change the frames/period to 1024 and click ok.
- Click start to start jack server.
- If you still receive the same error, then kill all jack processes and:
```shell
$ rm ~/.config/jack/conf.xml
$ sudo cp /vagrant/conf.xml ~/.config/jack/
$ jack_control start
```

## Notes
- Jack server configuration is located at: ~/.config/jack/conf.xml
- Jack server log is located at: ~/.log/jack/jackdbus.log
- Check the audio device:
```shell
$ aplay -L
```

