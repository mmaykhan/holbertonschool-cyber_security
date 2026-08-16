#!/bin/bash
grep "Accepted" $1 | awk '{print $9}' | tail -n 1
