#!/bin/bash
grep "Accepted" ${1:-auth.log} | awk '{print $9}' | tail -n 1
