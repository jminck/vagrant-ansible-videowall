# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "controller", primary: true do |h|
    h.vm.hostname =  "controller.videowall.ops.teamaol.com"
    h.vm.network "private_network", ip: "192.168.135.10"
    h.vm.network :forwarded_port, guest: 80, host: 8080
    h.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    end
    h.vm.provision "shell" do |provision|
      provision.path = "provision_controller.sh"
    end
    h.vm.provision :shell, :inline => <<'EOF'

	if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/control.pub

cat << 'SSHEOF' > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

chown -R vagrant:vagrant /home/vagrant/.ssh/
EOF
  end

  config.vm.define "tv1" do |h|
    h.vm.hostname = "tv1.videowall.ops.teamaol.com"
    h.vm.network "private_network", ip: "192.168.135.111"
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
    h.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--monitorcount", "2"]
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    end
    h.vm.provision "shell" do |provision|
      provision.path = "provision_tv.sh"
    end
  end

  config.vm.define "tv2" do |h|
    h.vm.hostname = "tv2.videowall.ops.teamaol.com"
    h.vm.network "private_network", ip: "192.168.135.112"
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
    h.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--monitorcount", "2"]
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    end
    h.vm.provision "shell" do |provision|
      provision.path = "provision_tv.sh"
    end
  end

end
