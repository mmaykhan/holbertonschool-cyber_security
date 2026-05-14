#!/bin/bash
cat << "EOF"
Include /etc/ssh/sshd_config.d/*.conf
KbdInteractiveAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
PasswordAuthentication yes
PermitRootLogin yes
AuthorizedKeysFile .ssh/authorized_keys
TCPKeepAlive yes
EOF
