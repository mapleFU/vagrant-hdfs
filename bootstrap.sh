# 更改
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# 更新软件包
sudo apt-get update

# 下载 JDK, 配置环境
sudo add-apt-repository ppa:webupd8team/java -y

sudo apt-get update

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

sudo dpkg --configure -a

sudo apt-get install oracle-java8-installer -y

sudo apt-get install oracle-java8-set-default -y

# 下载 hadoop 
sudo apt-get install -y wget

# wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
tar -xzvf  /vagrant/hadoop-config/hadoop-2.9.2.tar.gz    -C /usr/local 

# mv  hadoop  hadoop
