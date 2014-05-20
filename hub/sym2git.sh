#!/bin/sh
### set location to install emonhub.py etc
INST_PATH=/usr/share/emonhub

### set git cloned location
GIT_PATH=/home/pi/emonhub

### set private emonhub.conf location
CONF_PATH=/home/pi

### set log file loction
LOG_PATH=/var/log

### clone emonhub
git clone https://github.com/pb66/emonhub.git
#git clone https://github.com/emonhub/emonhub.git

### create folder and link for settings file
sudo mkdir -p /etc/emonhub
sudo rm -f /etc/emonhub/emonhub.conf
sudo ln -s $GIT_PATH/conf/emonhub.conf /etc/emonhub/emonhub.conf

### redirect to private emonhub.conf (back-up default)
sudo mv $GIT_PATH/conf/emonhub.conf $GIT_PATH/conf/emonhub.conf.default
sudo ln -s $CONF_PATH/emonhub.conf $GIT_PATH/conf/emonhub.conf

### link default locations file
sudo rm -f /etc/default/emonhub
sudo ln -s $GIT_PATH/conf/default/emonhub /etc/default/emonhub

### link init script
sudo rm -f /etc/init.d/emonhub
sudo ln -s $GIT_PATH/service/emonhub /etc/init.d/emonhub

### create linked directory for emonhub.py etc
sudo rm -r -f $INST_PATH
sudo ln -s $GIT_PATH/src $INST_PATH

### launch at start-ip
sudo update-rc.d emonhub defaults 99

### create emonhub user
sudo adduser  --system --no-create-home --ingroup dialout emonhub
sudo adduser emonhub tty
sudo adduser emonhub root

### create and own logfile
sudo touch $LOG_PATH/emonhub.log
sudo chown emonhub:root  /var/log/emonhub.log

###install dependancies
sudo apt-get install -y python-serial python-configobj

### start emonhub
sudo service emonhub restart
