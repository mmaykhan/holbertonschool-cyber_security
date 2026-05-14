#!/bin/bash
iptables -A INPUT -p tcp -s "$1" --dport 22 -j ACCEPT
iptables -P INPUT DROP
