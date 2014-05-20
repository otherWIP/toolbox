#!/bin/sh
### set location to install emonCMS files etc
INST_PATH=/usr/share/emoncms

### set git cloned location
GIT_PATH=/home/pi/emoncms

### set private emoncms.conf location
CONF_PATH=/home/pi

### set data loction
DATA_PATH=/data/cms

### set log file loction
LOG_PATH=/var/log

### clone emonhub
cd ~/
git clone https://github.com/pb66/emoncms.git
#git clone https://github.com/emoncms/emoncms.git

# create linked directory for emoncms files & folders
sudo rm -r -f $INST_PATH
sudo mkdir -p $INST_PATH
sudo ln -s $GIT_PATH $INST_PATH/www

#link

# Create the required feed directories and set ownership
DATA_PATH=/data/cms
sudo mkdir -p $DATA_PATH/phpfina
sudo mkdir -p $DATA_PATH/phpfiwa
sudo mkdir -p $DATA_PATH/phptimeseries
sudo mkdir -p $DATA_PATH/timestore
sudo mkdir -p $DATA_PATH/mysql
sudo ln -s $DATA_PATH/phpfina /var/lib
sudo ln -s $DATA_PATH/phpfiwa /var/lib
sudo ln -s $DATA_PATH/phptimeseries /var/lib
sudo ln -s $DATA_PATH/timestore /var/lib
sudo ln -s $DATA_PATH/mysql /var/lib
sudo chown www-data:root /var/lib/phpfina/
sudo chown www-data:root /var/lib/phpfiwa/
sudo chown www-data:root /var/lib/phptimeseries/
sudo chown www-data:root /var/lib/timestore/
sudo chown root:root /var/lib/mysql/



# install dependencies
sudo apt-get install apache2 libapache2-mod-php5 php5 php5-mysql php5-curl php5-dev php5-mcrypt libphp-swiftmailer mysql-server mysql-client ufw ntp


DATA_PATH=/media/data/emondata
DATA_PATH=/var/lib
