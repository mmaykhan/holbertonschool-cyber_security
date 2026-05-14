#!/bin/bash
grep -v -e "^#" -e "^$" /etc/ssh/sshd_config
