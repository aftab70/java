#!/bin/bash

mkdir /opt/elk
wget --directory-prefix=/opt/elk https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.4.2-amd64.deb
wget --directory-prefix=/opt/elk https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.2-amd64.deb
echo "Making downloaded packages executable"
chmod +x /opt/elk/*
dpkg -i /opt/elk/metricbeat-6.4.2-amd64.deb
dpkg -i /opt/elk/filebeat-6.4.2-amd64.deb
cp /home/tortoise/beats_installation/metricbeat.yml /etc/metricbeat/metricbeat.yml
cp /home/tortoise/beats_installation/system.yml /etc/metricbeat/modules.d/system.yml
metricbeat modules enable system
systemctl start metricbeat.service
cp /home/tortoise/beats_installation/filebeat.yml /etc/filebeat/filebeat.yml
filebeat modules enable system
systemctl start filebeat.service
systemctl enable filebeat.service
