#!/bin/sh
# This code is meant to turn a Kali instance
# into a guacamole server.
# Guacamole server default credetials are
# guacadmin/guacadmin

sudo apt update -y
wget https://gitlab.com/kalilinux/build-scripts/kali-wsl-chroot/-/raw/master/xfce4.sh
chmod +x xfce4.sh
sudo ./xfce4.sh
sudo systemctl enable xrdp --now
sudo apt install -y dbus-x11
sudo /etc/init.d/xrdp start
sudo apt install -y git
git clone https://github.com/MysticRyuujin/guac-install.git /tmp/guac-install
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/US/Central /etc/localtime
cd /tmp/guac-install/
sudo ./guac-install.sh --nomfa --installmysql --mysqlpwd S3cur3Pa$$w0rd --guacpwd P@s$W0rD
cd ~
sudo apt install -y tigervnc-standalone-server
mkdir -p ~/.vnc/
wget https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/-/raw/master/nethunter-fs/profiles/xstartup -O ~/.vnc/xstartup
sudo vncserver :1