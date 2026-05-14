#!/bin/bash
iptables -F && iptables -P INPUT DROP && iptables -P FORWARD DROP && iptables -P OUTPUT ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT && iptables -A INPUT -p tcp --dport 22 -j ACCEPT && iptables -A INPUT -i lo -j ACCEPT
