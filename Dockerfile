FROM ubuntu:14.04

MAINTAINER Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at>

# Change to root dir
WORKDIR /

# Install some basic tools
RUN sudo apt-get update -y
RUN sudo apt-get install libgmp10 wget apt-transport-https software-properties-common -y

# Install Prerequistes
RUN wget http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb -O cdh5-repository_1.0_all.deb
RUN sudo dpkg -i cdh5-repository_1.0_all.deb

RUN wget https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-1-amd64.deb -O pandoc-1.19.2.1-1-amd64.deb
RUN sudo dpkg -i pandoc-1.19.2.1-1-amd64.deb
RUN sudo add-apt-repository ppa:openjdk-r/ppa
# update packages 
RUN sudo apt-get update -y

# Install Java v8 and set as default
RUN sudo apt-get install openjdk-8-jdk jsvc git maven -y
RUN sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
RUN sudo rm /usr/lib/jvm/default-java
RUN sudo ln -s java-8-openjdk-amd64/ /usr/lib/jvm/default-java

# Install latest CDH5 MapReduce 1
RUN sudo apt-get install hadoop-0.20-conf-pseudo -y

# Add a hadoop user (Cloudgene) to execute jobs
RUN sudo useradd -ms /bin/bash cloudgene

# copy script to start Hadoop
COPY hadoop/start-hadoop /usr/bin/start-hadoop
RUN sudo chmod +x /usr/bin/start-hadoop

# generate some HDFS directories at startup
COPY scripts/init-hdfs.sh /usr/bin/init-hdfs.sh
RUN sudo chmod +x /usr/bin/init-hdfs.sh

# Use a template to calculate the amount of map and reduce tasks depending on amount of cores
COPY conf/mapred-site-template.xml /usr/bin/mapred-site-template.xml
COPY conf/core-site-template.xml /usr/bin/core-site-template.xml
COPY scripts/adapt-config.sh /usr/bin/adapt-config.sh
RUN sudo chmod +x /usr/bin/adapt-config.sh

COPY conf/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml

# Create a /data directory to make cluster persistent
RUN mkdir /data
VOLUME ["/data/"]

COPY scripts/execute-wordcount.sh /usr/bin/execute-wordcount.sh
RUN sudo chmod +x /usr/bin/execute-wordcount.sh

ENV EXEC_BASH="false"
ENV DOCKER_CORES="0"

#HDFS Ports
EXPOSE 50010 50020 50070 50075 50090

#MapReduce Ports
EXPOSE 50030 50050 50070
