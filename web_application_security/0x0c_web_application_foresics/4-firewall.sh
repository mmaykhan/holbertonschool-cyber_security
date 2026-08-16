#!/bin/bash
grep -i "iptables" ${1:-auth.log} | wc -l
