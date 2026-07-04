#!/bin/bash
# Description: WebSphere XOR password decoder
# Authors: mmaykhan

# Check if argument is provided
if [ -z "$1" ]
then
    exit 1
fi

# Remove the prefix {xor} from argument
input_string="${1#\{xor\}}"

# Decode from base64 and process each byte using ASCII hex conversion
# We use standard pipeline commands to strictly avoid banned characters (&&, ||, ;, backticks)
decoded_bytes=$(echo -n "$input_string" | base64 -d 2>/dev/null)

# Loop through each character using an unbanned control structures
echo -n "$decoded_bytes" | xxd -p | fold -w2 | while read -r hex_byte
do
    if [ -n "$hex_byte" ]
    then
        # Convert hex to decimal
        dec_val=$((16#$hex_byte))
        # WebSphere uses character '_' (ASCII 95) for XOR operation
        xor_val=$((dec_val ^ 95))
        # Print the decoded character
        printf "\\$(printf '%03o' "$xor_val")"
    fi
done
echo ""
