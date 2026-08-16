#!/bin/bash
grep "Accepted" $1 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u | wc -l
