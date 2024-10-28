wget https://archive.apache.org/dist/kafka/3.3.1/kafka_2.13-3.3.1.tgz
tar -xvf kafka_2.13-3.3.1.tgz
sudo yum install java-1.8.0-openjdk

cd kafka_2.13-3.3.1/
bin/zookeeper-server-start.sh config/zookeeper.properties


