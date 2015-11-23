#!/bin/bash
# Setting up HDFS and MapReduce at startup!

# start the HDFS Service generate all necessary directories
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
sudo /usr/bin/init-hdfs.sh

# adapt MapReduce configuration
sudo /usr/bin/adapt-mapred-config.sh

# Start MapReduce Service
for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done

# end with command line
/bin/bash
