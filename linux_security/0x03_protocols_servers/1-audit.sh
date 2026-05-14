#!/bin/bash
grep -E "^(PasswordAuthentication|PermitRootLogin|AuthorizedKeysFile|TCPKeepAlive|KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|Subsystem|Include)" /etc/ssh/sshd_config
