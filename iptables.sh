#!/bin/bash
# ---------------------------------------------------------------------
# Linux iptables init script, Copyright (c) 2013 GPL
# --------------------------------------------------------------------
### BEGIN INIT INFO
# Provides:          firewall
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable iptables and ip6tables rules
### END INIT INFO

# iptables lookup
iptables=`which iptables`
ip6tables=`which ip6tables`

# setup network device
device="eth0" #// KVM
#device="venet0" #// OpenVZ
#yourexternalid="12.34.56.78" #// Change this value!
#yourvpnsubnet="10.1.1.0/24" #// Change this value!

# stop if iptables is not found
test -f "$iptables" || exit 0
test -f "$ip6tables" || exit 0

echo "setting up iptables and ip6tables"

# flush tables
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -t nat -X
iptables -t mangle -X
    
ip6tables -F
ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -X
ip6tables -t nat -X
ip6tables -t mangle -X    

# set default policies
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
    
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP    

# MY_REJECT chain
iptables -N MY_REJECT
ip6tables -N MY_REJECT6

# MY_DROP chain
iptables -N MY_DROP
iptables -A MY_DROP -j DROP
    
ip6tables -N MY_DROP6
ip6tables -A MY_DROP6 -j DROP    

# drop invalid packages
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
    
ip6tables -A INPUT -m state --state INVALID -j DROP
ip6tables -A OUTPUT -m state --state INVALID -j DROP

# blocking null packets
iptables  -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
ip6tables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# block syn flood
iptables  -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
ip6tables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# block xmas packets / recon packets
iptables  -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
ip6tables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# allow loopback device traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
    
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT

# set tracking of connection
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

ip6tables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    
# allow ICMP ping
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT

ip6tables -A INPUT -p ipv6-icmp -j ACCEPT

# allow nodejs
# iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 8080 -j ACCEPT
# ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 8080 -j ACCEPT

# allow HTTP
iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 80 -j ACCEPT

# allow HTTPS
#iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 443 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 443 -j ACCEPT

# allow GITHUB
iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 9418 -j ACCEPT
ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 9418 -j ACCEPT

# allow SMTP
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 25 -j ACCEPT

# allow SMTPS
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 465 -j ACCEPT
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 587 -j ACCEPT

# allow POP3
#iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 110 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 110 -j ACCEPT

# allow POP3S
#iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 995 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 995 -j ACCEPT

# allow IMAP
#iptables  -A INPUT -i $device -m state --state NEW -p tcp --dport 143 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 143 -j ACCEPT

# allow IMAPS
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 993 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 993 -j ACCEPT

# allow NNTP
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 119 -j ACCEPT
#ip6tables -A INPUT -i $device -m state --state NEW -p tcp --dport 119 -j ACCEPT

# allow DNS queries
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 53 -j ACCEPT
#iptables -A INPUT -i $device -m state --state NEW -p udp --dport 53 -j ACCEPT
	
# Teamspeak
#iptables -I INPUT -p udp --dport 9987 -j ACCEPT
#iptables -I INPUT -p udp --sport 9987 -j ACCEPT

#iptables -I INPUT -p tcp --dport 30033 -j ACCEPT
#iptables -I INPUT -p tcp --sport 30033 -j ACCEPT

#iptables -I INPUT -p tcp --dport 10011 -j ACCEPT
#iptables -I INPUT -p tcp --sport 10011 -j ACCEPT

# allow FTP
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 21 -j ACCEPT
#iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 20 -j ACCEPT

# allow SSH
iptables -A INPUT -i $device -m state --state NEW -p tcp --dport 22 -j ACCEPT
    
# set default policies REJECT
iptables -A INPUT -j MY_REJECT
iptables -A OUTPUT -j MY_REJECT
    
ip6tables -A INPUT -j MY_REJECT6
ip6tables -A OUTPUT -j MY_REJECT6    
