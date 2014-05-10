#!/bin/sh
### set location to install emonhub.py etc
INST_PATH=/usr/share/emonhub

### set log file loction
LOG_PATH=/var/log

### set git cloned location
GIT_PATH=/home/pi/emonhub

### clone emonhub
git clone https://github.com/pb66/emonhub.git
#git clone https://github.com/emonhub/emonhub.git


### create folder and link for settings file (probally not used)
#mkdir -p /etc/emonhub
#sudo rm -f /etc/emonhub/emonhub.conf
#sudo ln -s $GIT_PATH/conf/emonhub.conf /etc/emonhub/emonhub.conf
CONF_PATH=/boot
sudo ln -s $CONF_PATH/emonhub.conf /etc/emonhub/emonhub.conf

### link default locations file
sudo rm -f /etc/default/emonhub
sudo ln -s $GIT_PATH/conf/default/emonhub /etc/default/emonhub

### link init script
sudo rm -f /etc/init.d/emonhub
sudo ln -s $GIT_PATH/service/emonhub /etc/init.d/emonhub

### create directory for emonhub.py etc
sudo rm -r -f $INST_PATH
sudo mkdir -p $INST_PATH
sudo ln -s $GIT_PATH/src/emonhub.py $INST_PATH/emonhub.py
sudo ln -s $GIT_PATH/src/emonhub_buffer.py $INST_PATH/emonhub_buffer.py
sudo ln -s $GIT_PATH/src/emonhub_dispatcher.py $INST_PATH/emonhub_dispatcher.py
sudo ln -s $GIT_PATH/src/emonhub_interface.py $INST_PATH/emonhub_interface.py
sudo ln -s $GIT_PATH/src/emonhub_listener.py $INST_PATH/emonhub_listener.py

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
