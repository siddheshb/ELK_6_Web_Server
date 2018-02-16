Elastic Stack 6x
================

Scope
-----
This Vagrant project will be installing Elasticsearch, Logstash, Kibana and File beat in a developer sandbox type environment.

Pre-Requisities
---------------
1. The installation will be conducted on Linux Centos 7 environment
2. Virtual Box needs to be installed as a Type 2 Hypervior
3. Vagrant needs to be installed on the machine where the scripts will be executed

Execution steps:
----------------
1. Clone the repository
2. NNavigate to the cloned folder and execute the following command
```
vagrant up
```
3] On the host machine, open a browser and execute the command below:
```
http://192.168.50.31:5601
```
This will display the Kibana 6.x home page

Configurations
--------------
The compute and network settings for the Vagrant VM can be changed in the file server_config.yaml. Following are the parameters.
1. name: Name of the Virtual machine
2. ram: The ram that will be allocated to this VM. Defaults to 8192 MB (8 GB)
3. network_type: private ( Corresponds to Host only network where the VM cannot be accessed from outisde the host machine) or public (Corresponds to Bridged Adapter configuration on Oracle VBox)
4. ip: The IP of the vagrant machine. This is mandatory if the network_type is private. Can be skipped if the network_type is public

Notes:
-----
In order to receive the output from the filebrat agents, it is necessary that the logstash service needs to be diabled and logstash pipeline is executed as a /bin/logstah command
