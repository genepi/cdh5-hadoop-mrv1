#!/bin/bash
# calculates the amount of processors and sets the map and reduce tasks accordingly in mapred-site.xml

#set CORES
if [ $1 != "0" ]; then
  CORES="$1"
else
   CORES=$(($(grep -c ^processor /proc/cpuinfo)-2))
fi

if [CORES < 1]
then
echo Setting cores to 1
CORES = 1
fi

# set HOSTNAME
HOST=$(grep "$HOSTNAME" /etc/hosts|awk '{print $1}')

echo set amount cores to $CORES
echo set hostname to $HOST

sed -e s/AMOUNT/$CORES/ -e s/HOSTNAME/$HOST/ /usr/bin/mapred-site-template.xml > /etc/hadoop/conf.pseudo.mr1/mapred-site.xml
sed s/HOSTNAME/$HOST/ /usr/bin/core-site-template.xml > /etc/hadoop/conf.pseudo.mr1/core-site.xml
