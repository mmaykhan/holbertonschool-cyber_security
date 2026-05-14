#!/bin/bash
find / -xdev -type d -perm -0002 -exec sh -c 'echo "$1"; chmod o-w "$1"' _ {} \; 2>/dev/null
