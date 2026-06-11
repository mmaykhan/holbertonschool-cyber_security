#!/bin/bash
whois $1 | awk -F: '/^(Registrant|Admin|Tech)/ {gsub(/^[ 	]+|[ 	]+$/, "", $2); if ($1 ~ /Street$/) $2=$2" "; print $1 "," $2}' | sed 's/Ext$/Ext:/g' > $1.csv
