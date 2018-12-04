# 更改
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# 更新软件包
sudo apt-get update

# 下载 JDK, 配置环境
sudo add-apt-repository ppa:webupd8team/java -y

sudo apt-get update

kill $(ps -e | grep 'apt-get' | awk '{print $1}')

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

sudo dpkg --configure -a

echo "[Info] Install oracle-java8-installer"
# RUN SILENT INSTALL
# https://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option install java automaticall 的时候碰到的傻屌问题
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
echo "[Info] Install oracle-java8-installer done"

sudo apt-get install oracle-java8-set-default -y
echo "[Info] Install oracle-java8-set-default done"

# 下载 hadoop 
# sudo apt-get install -y wget

# wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
sudo tar -xzvf  /vagrant/hadoop-2.9.2.tar.gz    -C /usr/local 

sudo mv /usr/local/hadoop-2.9.2 /usr/local/hadoop
# mv  hadoop  hadoop

# 设置环境变量
sudo sh -c "echo 'export HADOOP_HOME=/usr/local/hadoop' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:$HADOOP_HOME/bin' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile

sudo apt-get clean
