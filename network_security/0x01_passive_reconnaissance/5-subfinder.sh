#!/bin/bash
subfinder -d $1 -silent -oI -o $1.txt | awk -F, '{print $1}'
