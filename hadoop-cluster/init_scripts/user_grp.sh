sudo groupadd hadoopgroup

sudo usermod -a -G hadoopgroup vagrant

sudo chgrp -R hadoopgroup /usr/local/hadoop/

sudo chmod -R +w /usr/local/hadoop/

