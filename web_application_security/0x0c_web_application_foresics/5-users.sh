#!/bin/bash
grep -oP 'name=\K[^,]+' ${1:-auth.log} | sort -u | paste -sd,
