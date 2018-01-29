## Creating a Hadoop MapReduce (MRv1) Docker Image 

This Docker image allows you to execute Hadoop jobs with the MapReduce framework (MRv1, the "old" MapReduce) based on the currently latest Cloudera version (CDH5).


### Pull the image

	docker pull seppinho/cdh5-hadoop-mrv1:latest
	


### Run a new container (ends with /bin/bash)

	docker run -it -h cloudgene -p 50030:50030 seppinho/cdh5-hadoop-mrv1:latest run-hadoop-initial.sh



### Execute WordCount

	sh /usr/bin/execute-wordcount.sh



### Connect to the MapReduce web interface

    http://<ip-address>:50030

#### Cloudgene
The new version of Cloudgene allows to connect to a remote Hadoop cluster.
To connect it with a Hadoop Docker container add its hosts entry (e.g. 172.17.0.2 cloudgene) to your local hosts file. Add hostname to your Cloudgene settings.yaml file (e.g. hostname: cloudgene)

    cat /etc/hosts 
    
