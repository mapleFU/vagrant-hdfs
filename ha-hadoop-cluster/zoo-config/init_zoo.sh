#!/bin/bash

sudo sh -c "echo 'export PATH=$PATH:/usr/local/zookeeper/bin:/usr/local/zookeeper/sbin' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile
# core site, 感觉用一个数组 + 循环比较好...
sudo bash -c 'cp -ar /vagrant/zoo-config/zoo.cfg  /usr/local/zookeeper/conf/zoo.cfg'
