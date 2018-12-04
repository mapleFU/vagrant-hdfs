# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  
  config.vm.provision "disable-apt-periodic-updates", type: "shell" do |s|
    s.privileged = true
    s.inline = "echo 'APT::Periodic::Enable \"0\";' > /etc/apt/apt.conf.d/02periodic"
  end
  
  config.vm.synced_folder "./hadoop-config", "/hadoop-config", create: true, owner: "root", group: "root", mount_options: ["dmode=755","fmode=644"], type: "rsync"

  config.vm.provision :shell, path: "bootstrap.sh"
end
