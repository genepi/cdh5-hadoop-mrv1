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

### Connect to Cloudgene
The new version of Cloudgene allows to run it locally. 
To connect your local instance to Docker get your container hostname and it to your local hosts file:

    cat /etc/hosts 
    
