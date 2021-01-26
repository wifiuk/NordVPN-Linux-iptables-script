#!/bin/bash
# Run this a root user, or edit it yourself to add sudo in front of everything. I'm SSHd into my box as root.
# 
# Step one flush all iptables
# Commands to flush iptables
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X

# Show the current iptables clear
iptables -nvL

# Now we Stuff the tables again

# Enable Ip forwarding in case it got broken somewhere.
sudo sysctl net.ipv4.ip_forward=1

# Do a disconnect just in case and then a re-conect to nordvpn
nordvpn d && nordvpn c uk
# You can replace uk with any country code or specific sever e.g nordvpn c uk1234
#
# Here NordVPN decimates the iptables and add's it own crap in there, I need to also add forwarding afterwards
# using the rule below after Nord's mashup.
#
# Stuffing the tables
sudo iptables -t nat -A POSTROUTING -o nordlynx -j MASQUERADE
sudo iptables -A FORWARD -i nordlynx -o eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o nordlynx -j ACCEPT

#Show the current iptables
iptables -nvL
# Show the current route
ip route
#Run a download speed test
wget -O /dev/null http://mirror.cov.ukservers.com/1g.bin --report-speed=bits
