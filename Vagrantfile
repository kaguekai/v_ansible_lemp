# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  #config.vm.box = "laravel/homestead"
  #config.vm.box = "bento/centos-7.1"
  #config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "ubuntu/xenial64"
  config.vm.box = "bento/ubuntu-16.04"

  # プロダクトサーバ
  config.vm.define :web do |web|
    web.vm.network "private_network", ip: "192.168.33.11"
    web.vm.hostname = "local.localhostcom"
    # vagrant-hostsupdater
    web.hostsupdater.aliases = ["local.www.localhostcom", "local.www2.localhostcom"]
    #web.vm.provision "shell", path: "data/web/sh/setup.sh"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    web.vm.synced_folder "./data/web/src", "/var/www/localhostcom", :mount_options => ['dmode=777', 'fmode=777']
  end

  # 管理サーバ/プロビジョニング
  config.vm.define :adm do |adm|
    adm.vm.network "private_network", ip: "192.168.33.10"
    adm.vm.hostname = "local.adm.localhostcom"
    # shell
    adm.vm.provision "shell", path: "./data/adm/sh/setup.sh"
    # ansible_local
    adm.vm.provision :ansible_local do |ansible|
      ansible.playbook       = "/vagrant_data/ansible/playbook/web.yml"
      ansible.verbose        = true
      ansible.install        = true
      ansible.limit          = "all" # or only "nodes" group, etc.
      ansible.inventory_path = "/vagrant_data/ansible/hosts"
    end
    adm.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    adm.vm.synced_folder "./data/adm", "/vagrant_data", :mount_options => ['dmode=777', 'fmode=777']
  end
end
