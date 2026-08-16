# Web Application Forensics

This directory contains bash scripts for analyzing system logs (`auth.log`, `dmesg`) to investigate web application security incidents and attacker activity.

## Tasks
* `0-service.sh`: Identifies the service targeted by attackers.
* `1-operating.sh`: Extracts the operating system version from dmesg logs.
* `2-accounts.sh`: Determines the compromised user account.
* `3-ips.sh`: Counts distinct attacker IP addresses that gained access.
* `4-firewall.sh`: Counts firewall rules added during mitigation.
* `5-users.sh`: Lists created user accounts on the target system.
