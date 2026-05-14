#!/bin/bash
printf "Include /etc/ssh/sshd_config.d/*.conf\nKbdInteractiveAuthentication no\nUsePAM yes\nX11Forwarding yes\nPrintMotd no\nAcceptEnv LANG LC_*\nSubsystem       sftp    /usr/lib/openssh/sftp-server\nPasswordAuthentication yes\nPermitRootLogin yes\nAuthorizedKeysFile .ssh/authorized_keys\nTCPKeepAlive yes\n"
