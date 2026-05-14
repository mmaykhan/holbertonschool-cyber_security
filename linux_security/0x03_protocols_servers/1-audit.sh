#!/bin/bash
grep -vE "^#|^$" /etc/ssh/sshd_config | grep -v "^[[:space:]]*#"
