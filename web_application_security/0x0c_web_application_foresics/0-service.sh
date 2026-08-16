#!/bin/bash
grep sshd ${1:-auth.log} | awk '{print $6}' | sort | uniq -c | sort -nr
