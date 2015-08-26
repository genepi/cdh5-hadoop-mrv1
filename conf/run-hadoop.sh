#!/bin/bash

# start HDFS and generate directories
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
sudo /usr/bin/init-hdfs.sh

# start MAPRED with new config
sudo /usr/bin/adapt-mapred-config.sh
for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done

# end with command line
/bin/bash
