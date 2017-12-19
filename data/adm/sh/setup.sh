#!/usr/bin/env bash

#if ! [ `which ansible` ]; then
	#sudo yum update
  # EPELを追加
	#sudo yum install epel-release
  # remiを追加
  #sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
  # ansible install
  #sudo yum install ansible
#fi

# Inventoryファイルを指定してplaybookを実行
#ansible-playbook -i /vagrant_data/ansible/hosts /vagrant_data/ansible/playbook/web.yml

#sudo su - vagrant
sudo cp -af /vagrant_data/ansible/ansible.cfg /vagrant/

# web
cp -a /vagrant/.vagrant/machines/web/virtualbox/private_key /home/vagrant/.ssh/private_key
sudo chmod 0600 /home/vagrant/.ssh/private_key
