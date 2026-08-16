#!/bin/bash
grep -oP 'name=\K[^,]+' $1 | sort -u | paste -sd,
