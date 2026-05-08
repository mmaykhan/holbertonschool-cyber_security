#!/bin/bash
ps -u "$1" -f | grep -vE "[[:space:]]0[[:space:]]+0[[:space:]]"
