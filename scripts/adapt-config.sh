#!/bin/bash
# calculates the amount of processors and sets the map and reduce tasks accordingly in mapred-site.xml
line=$(($(grep -c ^processor /proc/cpuinfo)-1))
hostname=$(grep "$HOSTNAME" /etc/hosts|awk '{print $1}')
sed -e s/AMOUNT/$line/ -e s/HOSTNAME/$hostname/ /usr/bin/mapred-site-template.xml > /etc/hadoop/conf.pseudo.mr1/mapred-site.xml
sed s/HOSTNAME/$hostname/ /usr/bin/core-site-template.xml > /etc/hadoop/conf.pseudo.mr1/core-site.xml
