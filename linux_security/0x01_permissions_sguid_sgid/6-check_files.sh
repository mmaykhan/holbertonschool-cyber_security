#!/bin/bash
find "$1" -perm /6000 -mtime 0 -ls 2>/dev/null
