cat /vagrant/server-config-middleware/id_rsa > /home/vagrant/.ssh/id_rsa
cat /vagrant/server-config-middleware/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

bash ./public_ssh_allow.sh
