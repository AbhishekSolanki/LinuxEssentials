mkdir -p /opt/packages
sudo chown ubuntu:ubuntu /opt/packages/

============
# Java 1.8 #
============
# https://download.oracle.com/otn/java/jdk/8u231-b11/5b13a193868b4bf28bcb45c792fce896/jdk-8u231-linux-x64.tar.gz?AuthParam=1578367644_82b21aa9dbea98ceda4e6f71a02ce260
tar -xzvf ~/Downloads/jdk-8u231-linux-x64.tar.gz -C /opt/packages


=============
# ZOOKEEPER #
=============
#https://www-eu.apache.org/dist/zookeeper/stable/apache-zookeeper-3.5.6-bin.tar.gz
tar -xzvf ~/Downloads/apache-zookeeper-3.5.6-bin.tar.gz -C /opt/packages

#Start
/opt/packages/apache-zookeeper-3.5.6-bin/bin/zkServer.sh start /opt/packages/apache-zookeeper-3.5.6-bin/conf/zoo_sample.cfg

#stop
/opt/packages/apache-zookeeper-3.5.6-bin/bin/zkServer.sh stop

=========
# KAFKA #
=========
#https://downloads.lightbend.com/scala/2.13.1/scala-2.13.1.tgz
tar -xzf ~/Downloads/kafka_2.13-2.4.0.tgz -C /opt/packages

#start
/opt/packages/kafka_2.13-2.4.0/bin/kafka-server-start.sh /opt/packages/kafka_2.13-2.4.0/config/server.properties 

=========
# SCALA #
=========
#https://downloads.lightbend.com/scala/2.13.1/scala-2.13.1.tgz
tar -xzvf ~/Downloads/scala-2.13.1.tgz -C /opt/packages

==========
# DOCKER #
==========

#installation
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io


#proxy configuration
# sudo mkdir -p /etc/systemd/system/docker.service.d
# sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf and https-proxy.conf
# add below 2 lines into two files 
#[Service]
#Environment="HTTP_PROXY=http://proxy.example.com:80/"
sudo systemctl daemon-reload #Flush changes
sudo systemctl restart docker #Restart docker
systemctl show --property=Environment docker #verify
sudo systemctl enable docker


==============
# KUBERNETES #
==============

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt install kubeadm
