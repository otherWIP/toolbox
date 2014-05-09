Toolbox
=======

Scripts and tools used to develop &amp; test emonHub & emonCMS


To clone this toolbox to home dir

    cd ~/
    git clone https://github.com/otherWIP/toolbox.git 
    
--------------------
    
To clone emonHub and symlink all files except emonhub.conf

    ~/toolbox/emonhub/sym2git.sh

----------------------
    
To install emonHub in a way that mimics apt-get install
    
    ~/toolbox/emonhub/install.sh

-----------------------

To uninstall emonhub

    ~/toolbox/emonhub/uninstall.sh
    
-------------------------------    
    
To test the start stop restart reload status deamon messages

    ~/toolbox/emonhub/daemon-test.sh
