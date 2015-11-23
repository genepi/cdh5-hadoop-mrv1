#!/bin/bash

# start HDFS and generate directories
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
sudo /usr/bin/init-hdfs.sh

# adapt mapreduce config
sudo /usr/bin/adapt-mapred-config.sh

# Start MapReduce
for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done

# end with command line
/bin/bash
