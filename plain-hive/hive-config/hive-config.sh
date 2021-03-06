sudo tar -xzvf  /vagrant/hive-config/apache-hive-3.1.1-bin.tar.gz    -C /usr/local 

sudo mv /usr/local/apache-hive-3.1.1-bin /usr/local/hive

# 设置环境变量
sudo sh -c "echo 'export HIVE_HOME=/usr/local/hive' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:$HIVE_HOME/bin' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile

# set authority

sudo chgrp -R hadoopgroup /usr/local/hive/

sudo chmod -R 777 /usr/local/hive/

sudo rm /home/vagrant/metastore_db/*.lck
# INITIALIZE
$HIVE_HOME/bin/schematool -initSchema -dbType derby

sudo rm /home/vagrant/metastore_db/*.lck
