#!/bin/sh
sudo apt-get -y install xrdp gparted
#using gparted over xrdp as root causes error as ".Xauthority cannot be copied"
#have fixed this previously by creating file, (not currenly working poss auth)
touch ~/.Xauthorization

