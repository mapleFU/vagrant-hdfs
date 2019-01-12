
if [ -d "/usr/local/hbase" ]; then 
    echo "hbase existed"
else
    sudo tar -xzvf  /vagrant/hbase-config/hbase-2.0.3-bin.tar.gz    -C /usr/local 
    sudo mv /usr/local/hbase-2.0.3 /usr/local/hbase
    sudo sh -c "echo 'export HBASE_HOME=/usr/local/hbase' >> /etc/profile"
    sudo sh -c "echo 'export PATH=$PATH:$HBASE_HOME/bin' >>  /etc/profile"
    # sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
    # sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

    source /etc/profile

    # set authority

    sudo chgrp -R hadoopgroup /usr/local/hbase/

    sudo chmod -R 777 /usr/local/hbase/
fi


# 设置环境变量
# sudo bash -c 'echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-oracle\"" >> /usr/local/hbase/conf/hbase-env.sh'
# sudo bash -c 'echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-oracle\"" >> /usr/local/hbase/conf/hbase-env.sh'
# sudo bash -c 'echo "export HBASE_PID_DIR=\"/var/hadoop/pids\"" >> /usr/local/hbase/conf/hbase-env.sh'
# sudo bash -c 'echo "export HBASE_MANAGES_ZK=false" >> /usr/local/hbase/conf/hbase-env.sh'

sudo bash -c 'cp -ar /vagrant/hbase-config/hbase-env.sh  /usr/local/hbase/conf/hbase-env.sh'

sudo bash -c 'cp -ar /vagrant/hbase-config/hbase-site.xml  /usr/local/hbase/conf/hbase-site.xml'
sudo bash -c 'cp -ar /vagrant/hbase-config/regionservers /usr/local/hbase/conf/regionservers'
sudo bash -c 'cp -ar /vagrant/hbase-config/backup-masters /usr/local/hbase/conf/backup-masters'

sudo bash -c "cp -ar /vagrant/hadoop-config/core-site.xml /vagrant/hadoop-config/hdfs-site.xml /usr/local/hbase/conf/"

if [ -d "/var/hadoop/pids" ]; then
    echo "hbase, nmsl"
else
    sudo mkdir -p /var/hadoop/pids
    
fi

sudo chgrp -R hadoopgroup /var/hadoop/pids

sudo chmod -R 777 /var/hadoop/pids
