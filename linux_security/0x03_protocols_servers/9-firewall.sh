#!/bin/bash
# Script to set up basic iptables firewall rules that block all incoming traffic except SSH
iptables -A INPUT -p tcp --dport ssh -j ACCEPT && iptables -P INPUT DROP
