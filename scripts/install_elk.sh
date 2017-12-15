#!/bin/bash

echo "################################################################################"
echo "                     Install Open JDK 8                                         "
echo "################################################################################"
echo 
echo

sudo su -c "yum -y install java-1.8.0-openjdk"

echo "################################################################################"
echo "                     Install Elastic Search 6.0                                 "
echo "################################################################################"
echo 
echo
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.1.rpm
sudo rpm -Uvh elasticsearch-6.0.1.rpm
sudo rm -rf elasticsearch-6.0.1.rpm
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

echo
echo
echo "################################################################################"
echo "                     Install Logstash 6.0                                       "
echo "################################################################################"
echo 
echo
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo cp /vagrant/repo/logstash.repo /etc/yum.repos.d/logstash.repo
sudo yum -y install logstash
sudo systemctl daemon-reload
sudo systemctl enable logstash
sudo systemctl start logstash

echo
echo
echo "################################################################################"
echo "                     Install Kibana 6.0                                         "
echo "################################################################################"
echo 
echo

sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-6.0.1-x86_64.rpm
sudo rpm -Uvh kibana-6.0.1-x86_64.rpm
sudo rm -rf kibana-6.0.1-x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl enable kibana
sudo systemctl start kibana

echo
echo
echo "################################################################################"
echo "                     Install File Beat                                          "
echo "################################################################################"
echo 
echo
sudo curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.0-x86_64.rpm
sudo rpm -vi filebeat-6.1.0-x86_64.rpm

echo
echo
echo "################################################################################"
echo "                     Install Apache Server                                      "
echo "################################################################################"
echo 
echo
sudo yum -y install httpd
sudo mkdir -p /var/www/html/example.com/{public_html,logs}
sudo systemctl daemon-reload
sudo systemctl enable httpd.service
sudo systemctl restart httpd.service

echo
echo
echo "################################################################################"
echo "                     Copy the ELK Config files                                  "
echo "################################################################################"
echo 
echo
sudo cp /vagrant/config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo cp /vagrant/config/logstash.yml /etc/logstash/logstash.yml
sudo cp /vagrant/config/kibana.yml /etc/kibana/kibana.yml
sudo systemctl restart elasticsearch
sudo systemctl restart logstash
sudo systemctl restart kibana