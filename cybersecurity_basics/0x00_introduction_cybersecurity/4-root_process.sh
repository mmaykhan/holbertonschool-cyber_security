#!/bin/bash
ps aux | grep "^$1 " | grep -E -v " +0 +0 "
