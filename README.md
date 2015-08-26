# Creating a Docker Image for Cloudera's distribution of Hadoop MapReduce (MRv1)

This Docker image allows you to execute Hadoop jobs with MapReduce (MRv1, the "old" MapReduce) based on the currently latest Cloudera version (CDH5).


Pull the image

	docker pull seppinho/cdh5-hadoop-mrv1:latest
	

Run the image

	docker run -it -p 50030:50030 seppinho/cdh5-hadoop-mrv1:latest


Give it a try and execute "WordCount" inside the started Docker container

	sh /usr/bin/execute-wordcount.sh


Connect to the MapReduce web interface from your local OS to see the status of your executed job

    http://localhost:50030
