#!/bin/bash

# Function to print Unicode characters
print_unicode_range() {
    local start=$1
    local end=$2
    local column_count=$3

    for ((i=start; i<=end; i++)); do
        # Convert hexadecimal code point to UTF-8 bytes
        hex=$(printf "%x" "$i")
        # Echo with Unicode escape sequence
        echo -ne "$(echo -e "\u${hex}") "
        if (( (i - start + 1) % column_count == 0 )); then
            echo
        fi
    done
    echo
}

# Print emojis in specified ranges
echo "Printing emojis from U+1F600 to U+1F64F:"
print_unicode_range 0x1F600 0x1F64F 10

echo "Printing emojis from U+1F300 to U+1F5FF:"
print_unicode_range 0x1F300 0x1F5FF 10

echo "Printing emojis from U+1F680 to U+1F6FF:"
print_unicode_range 0x1F680 0x1F6FF 10

echo "Printing emojis from U+1F700 to U+1F77F:"
print_unicode_range 0x1F700 0x1F77F 10

