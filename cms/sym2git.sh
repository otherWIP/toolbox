#!/bin/sh
### set location to install emonCMS files etc
INST_PATH=/usr/share/emoncms

### set git cloned location
GIT_PATH=/home/pi/emoncms

### set private emoncms.conf location
CONF_PATH=/home/pi

### set log file loction
LOG_PATH=/var/log

### clone emonhub
cd ~/
git clone https://github.com/pb66/emoncms.git
#git clone https://github.com/emoncms/emoncms.git




DATA_PATH=/media/data/emondata
DATA_PATH=/var/lib
