#!/bin/sh
git clone https://github.com/pb66/emonhub.git
#git clone https://github.com/emonhub/emonhub.git
INST_PATH=/usr/share/emonhub
LOG_PATH=/var/log
TEMP_PATH=`pwd`/emonhub
echo
echo "Installing emonHub................"
sudo mkdir -p /etc/emonhub
sudo rm -r -f $INST_PATH
sudo mkdir -p $INST_PATH
sudo mv $TEMP_PATH/conf/default/emonhub /etc/default
sudo mv -b $TEMP_PATH/conf/emonhub.conf /etc/emonhub
sudo mv $TEMP_PATH/service/emonhub /etc/init.d
sudo mv $TEMP_PATH/src/* $INST_PATH
#sudo mkdir -p $LOG_PATH
#sudo chown pi:pi $LOG_PATH
sudo mv $TEMP_PATH/README.md $INST_PATH
sudo update-rc.d emonhub defaults 99
### create emonhub user
sudo adduser  --system --no-create-home --ingroup dialout emonhub
sudo adduser emonhub tty
sudo adduser emonhub root
# temporary fix for log file permission,
sudo touch $LOG_PATH/emonhub.log
sudo chown emonhub:root  /var/log/emonhub.log
sudo apt-get install -y python-serial python-configobj
echo
sudo service emonhub restart
echo
echo "emonHub has been installed, configure before use"
echo "    ' sudo nano /etc/emonhub/emonhub.conf '    "
echo "after editing configuration, restart service use"
echo "        ' sudo service emonhub restart '        "
echo
sudo rm -r $TEMP_PATH
