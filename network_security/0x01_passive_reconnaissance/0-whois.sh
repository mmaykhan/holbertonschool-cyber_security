#!/bin/bash
whois "$1" | awk -F: '/^[ \t]*(Registrant|Admin|Tech)/ {k=$1; v=$2; gsub(/^[ \t]+|[ \t]+$/, "", k); gsub(/^[ \t]+|[ \t]+$/, "", v); if (k ~ /Ext/) k=k":"; if (k ~ /Street/) v=v" "; if (k ~ /PostalCode/) k="Postal Code"; if (k ~ /State/) k="State/Province"; print k "," v}' > "${1}.csv"
