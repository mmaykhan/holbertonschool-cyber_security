#!/bin/bash
ps -u "$1" -f | grep -vE "0[[:space:]]+0"
