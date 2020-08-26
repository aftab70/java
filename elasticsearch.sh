#!/bin/bash

set -x
set -e


sudo apt-get update
sudo apt-get install default-jdk -y
java -version
sudo apt install apt-transport-https -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch -y
sed -i '17s@#cluster.name: my-application@cluster.name: ot-microservices@' /etc/elasticsearch/elasticsearch.yml
sed -i '55s@#network.host: 192.168.0.1@http.host: 0.0.0.0@' /etc/elasticsearch/elasticsearch.yml
sudo systemctl restart elasticsearch.service
curl http://192.168.1.7:9200
