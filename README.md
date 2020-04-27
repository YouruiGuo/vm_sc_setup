
## Clone

- Clone this repo to your local machine using `https://github.com/YouruiGuo/vm_sc_setup.git`
```shell
$ git clone https://github.com/YouruiGuo/vm_sc_setup.git
$ cd vm_sc_setup
```

## Setup

- Run the script init.sh

```shell
$ chmod u+x init.sh
$ ./init.sh
```

- After the VM is rebooted, you can login with the password vagrant.
- Run supercollider and the path of file is ~/soundscape_experiment/play2.scd.
- Put the cursor at the first line and execute it using ctrl+enter, then move the cursor to the next line and execute with ctrl+enter.
- Open the terminal and:

```shell
$ jack_control start
$ cd ~/soundscape_experiment
$ python runner.py
```

## Q&A
> No sound when running the code:
- Go to the setting of Virtualbox machine, enable audio output under audio tab. Then, reboot the virtual box. 

> Unable to boot the server in supercollider:
- Open terminal and type:
```
$ ps aux | grep jack
```
- If there are more than one processes running jack, kill all processes and restart jack server:
```
$ kill -9 #proc
$ jack_control start
```
- If it is still not working, check the log of jack server:
```
$ cat ~/.log/jack/jackdbus.log
```

## Notes
- Jack server configuration is located at: ~/.config/jack/conf.xml
- Jack server log is located at: ~/.log/jack/jackdbus.log
- Check the audio device:
```
aplay -L
```

