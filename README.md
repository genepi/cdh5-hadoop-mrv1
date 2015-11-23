# Creating a Hadoop MapReduce (MRv1) Docker Image

This Docker image allows you to execute Hadoop jobs with the MapReduce framework (MRv1, the "old" MapReduce) based on the currently latest Cloudera version (CDH5).


## Pull the image

	docker pull seppinho/cdh5-hadoop-mrv1:latest
	


## Run a new container (ends with /bin/bash)

	docker run -it -p 50030:50030 seppinho/cdh5-hadoop-mrv1:latest run-hadoop-initial.sh



## Execute WordCount

	sh /usr/bin/execute-wordcount.sh



## Connect to the MapReduce web interface from your local OS to see the status of your executed job

    http://<ip-address>:50030
