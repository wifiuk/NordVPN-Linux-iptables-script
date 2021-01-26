# NordVPN-Linux-iptables-script
A script to fix the problem NordVPN Linux CLI is causing.


First off, the Linux CLI app is buggy as fuck and has caused many issues. I've wasted many hours troubleshooting stuff to find its nord linux CLI again causing the issues.


couple of thoughts to note.

1) I dont think the Nordvpn Linux CLI supports Ubuntu 20.04 or newer very well, it fucks around with the DNS systems something chronic and gets all stuck ends up having to reboot.
2) This is specifically when using NordLynx(wireguard) protocol. No issues at all with .ovpn.
3) It fucks with the IPtables and causes problems
4) This is tailored to my situation, using a Linux based box as a router behind my PfSense firewall. PfSense at the time of writing has not released the wireguard protocol nativly in the CE edition. NordVPN will not release wireguard config files, or any setup information.

So all devices on my LAN route to this Linux box, which then connects to NordVPN and routes all traffic via the Nordvpn Interface.

There is sadly double NAT, but if you know how to whitelist via iptables then you should be ok as the PfSense rules are trivial.

Shouout to Arch people for having decent documentation 
https://wiki.archlinux.org/index.php/Simple_stateful_firewall

I need the speed as ovpn throttles me so have to stick with wireguard.


This script, fixes an issue for me . Feel freee to use it in your own way.
