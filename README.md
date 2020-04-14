
### Clone

- Clone this repo to your local machine using `https://github.com/YouruiGuo/vm_sc_setup.git`
```shell
$ git clone https://github.com/YouruiGuo/vm_sc_setup.git
$ cd vm_sc_setup
```

### Setup

- Run the script init.sh

```shell
$ chmod u+x init.sh
$ ./init.sh
```

- After the VM is rebooted, you can login with the password vagrant.
- Run supercollider and the path of file is ~/soundscape_experiment/play2.scd.
- Open the terminal and:

```shell
$ jack_control start
$ cd ~/soundscape_experiment
$ python runner.py
```
