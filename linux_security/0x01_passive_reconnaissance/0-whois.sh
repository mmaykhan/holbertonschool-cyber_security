#!/bin/bash
whois $1 | awk -F':[ 	]*' 'BEGIN{split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext,Fax,Fax Ext,Email",f,","); split("Registrant,Admin,Tech",p,",")} /^Registrant|^Admin|^Tech/{k=$1; v=$2; sub(/^[ 	]+|[ 	]+$/, "", v); data[k]=v} END{for(i=1;i<=3;i++){for(j=1;j<=12;j++){cn=p[i]" "f[j]; val=data[cn]; fn=f[j]; if(fn~"Ext") fn=fn":"; if(fn~"Street" && val!="") val=val" "; printf "%s,%s
", p[i]" "fn, val}}}' | grep -v "^," > $1.csv
