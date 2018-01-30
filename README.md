## Creating a Hadoop MapReduce (MRv1) Docker Image 

[![Docker Build Status](https://img.shields.io/docker/build/genepi/cdh5-hadoop-mrv1.svg)](https://hub.docker.com/r/genepi/cdh5-hadoop-mrv1)
[![Docker Pulls](https://img.shields.io/docker/pulls/genepi/cdh5-hadoop-mrv1.svg)](https://hub.docker.com/r/genepi/cdh5-hadoop-mrv1)


This Docker image allows you to execute Hadoop jobs with the MapReduce framework (MRv1, the "old" MapReduce) based on the currently latest Cloudera version (CDH5). 


### Pull the image

	docker pull genepi/cdh5-hadoop-mrv1:latest
	


### Run a new container (ends with /bin/bash)

	docker run -it -h cloudgene -p 50030:50030 -e EXEC_BASH="true" genepi/cdh5-hadoop-mrv1:latest start-hadoop



### Execute WordCount

	sh /usr/bin/execute-wordcount.sh



### Connect to the MapReduce web interface

    http://cloudgene:50030

#### Cloudgene
The new version of Cloudgene allows to connect to a remote Hadoop cluster.
To connect it with a Hadoop Docker container add its hosts entry (e.g. 172.17.0.2 cloudgene) to your local hosts file. Add hostname to your Cloudgene settings.yaml file (e.g. hostname: cloudgene)

    cat /etc/hosts 
    
