#!/bin/bash

# define the SFTP server port to 15955
sed -i 's/Port 22/Port 15955/' /etc/ssh/sshd_config

# after changing SSH server configuration file, restart the SSH server 
systemctl restart sshd

# Allow access to port 15955 from the local network
iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 15955 -j ACCEPT

# Allow access to port 15955 from the private IP address of the executer
iptables -A INPUT -s 212.3.194.254/32 -p tcp --dport 15955 -j ACCEPT


# Save rules of iptables
sudo netfilter-persistent save