# Creating a Docker Image for Cloudera Hadoop MapReduce (CDH5)

This image gives you a ready-to-use Docker image to execute Hadoop jobs with MapReduce (MRv1).


Pull the image

	docker pull seppinho/cdh5-hadoop-mrv1:latest

Run the image

	docker run -it -p 50030:50030 seppinho/cdh5-hadoop-mrv1:latest


Execute WordCount inside the Docker container

	sh /usr/bin/execute-wordcount.sh

Connect to the MapReduce web interface from your local OS

    http://localhost:50030