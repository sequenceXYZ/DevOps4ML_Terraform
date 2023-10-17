#!/bin/bash

# create a user for the SFTP server
sudo useradd -g admin admin

# set passwordles access for the user
sudo passwd -d admin

# add user to 'admin' group
sudo usermod -aG admin admin

# create a dedicated SFTP directory
sudo mkdir /var/sftp/admin

# change the ownership of the SFTP directory to the admin user
sudo chown admin:admin /var/sftp/admin

# enable the SFTP server
sudo systemctl enable ssh

# start the SFTP server
sudo systemctl start ssh

