#!/bin/bash
sudo groupadd hadoopgroup



sudo bash -c 'echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-oracle\"" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh'
sudo bash -c 'echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh'

# 不要加斜杠
export src_cfg="/vagrant/hadoop-config"
export dest_cfg="/usr/local/hadoop/etc/hadoop" 
# core site, 感觉用一个数组 + 循环比较好...
sudo bash -c 'cp -ar /vagrant/hadoop-config/core-site.xml  /usr/local/hadoop/etc/hadoop/core-site.xml'
sudo bash -c 'cp -ar /vagrant/hadoop-config/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml'
sudo bash -c 'cp -ar /vagrant/hadoop-config/mapred-site.xml  /usr/local/hadoop/etc/hadoop/mapred-site.xml'
sudo bash -c 'cp -ar /vagrant/hadoop-config/yarn-site.xml  /usr/local/hadoop/etc/hadoop/yarn-site.xml'
sudo bash -c 'cp -ar /vagrant/hadoop-config/master  /usr/local/hadoop/etc/hadoop/master'

# TODO: 探究为什么他妈的不行
# sudo bash -c 'cp ${src_cfg}/master > ${dest_cfg}/master'

sudo bash -c 'cp -ar /vagrant/hadoop-config/masters /usr/local/hadoop/etc/hadoop/masters'

sudo bash -c 'cat /vagrant/hadoop-config/slaves > /usr/local/hadoop/etc/hadoop/slaves'

