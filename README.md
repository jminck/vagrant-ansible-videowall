# Overview

This is the baseline configuration to implement a Videowall TV control solution in VMs.

Prerequisites
--
This configuration depends on the vagrant-hostmanager plugin, which  will manage hosts files on the Vagrant VMs as well as the host itself.

 ```vagrant plugin install vagrant-hostmanager```

 Note - when running "vagrant up", you may be prompted to enter the password for your host machine. This is so that Vagrant can edit your hosts file
 and insert host entries for each of the VMs into it so you don't have to.
 
Getting Started
-- 

clone this repo ```git clone https://github.com/jminck/vagrant-ansible-videowall.git```

run ```vagrant up``` from the root of the cloned repo (same folder where the Vagrantfile is)
