#!/bin/bash
find / -xdev -type d -perm -0002 2>/dev/null -exec sh -c 'echo "$1"; chmod o-w "$1"' _ {} \;
