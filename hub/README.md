--------------------
    
To just clone emonHub and symlink all files (except emonhub.conf, commented out, expects to find a copy in homedir)

    nano ~/emonhub.conf
    ~/toolbox/hub/sym2git.sh

----------------------
    
To install emonHub in a way that mimics apt-get install
    
    ~/toolbox/hub/install.sh

-----------------------

To uninstall emonhub

    ~/toolbox/hub/uninstall.sh
    
-------------------------------    
    
To test the start stop restart reload status deamon messages

    ~/toolbox/hub/daemon-test.sh
