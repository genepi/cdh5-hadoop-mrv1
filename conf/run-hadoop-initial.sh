#!/bin/bash
# Setting up HDFS and MapReduce at startup!

# adapt MapReduce configuration
sudo /usr/bin/adapt-config.sh

# start the HDFS Service generate all necessary directories
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
sudo /usr/bin/init-hdfs.sh

# Start MapReduce Service
for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done

#print ip

hostname=$(grep "$HOSTNAME" /etc/hosts|awk '{print $1}')
echo "Congratulations! Cluster is running on $hostname"


# end with command line
/bin/bash
