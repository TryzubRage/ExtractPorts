#!/bin/bash
# ==============================================================================
# Extract Ports - Nmap Port Extractor for Silent Scans
# ==============================================================================
# Description:  Extracts open TCP ports from .nmap scan files and automatically
#               copies them to clipboard in comma-separated format.
#               Optimized for stealth scans (TCP SYN -sS).
#
# Author:       [Your name]
# Version:      1.0
# Usage:        extract_ports <file.nmap>
# Example:      extract_ports stealth_scan.nmap
#
# Output:       22,80,443,3306,8080 (copied to clipboard)
# ==============================================================================

if [ $# -eq 0 ]; then
    echo "Usage: extract_ports <file.nmap>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File not found"
    exit 1
fi

grep -E "^[0-9]+/tcp\s+open" "$1" | cut -d'/' -f1 | paste -sd ',' | xclip -selection clipboard 2>/dev/null || \
grep -E "^[0-9]+/tcp\s+open" "$1" | cut -d'/' -f1 | paste -sd ',' | wl-copy 2>/dev/null

echo "✅ Ports copied to clipboard:"
grep -E "^[0-9]+/tcp\s+open" "$1" | cut -d'/' -f1 | paste -sd ','
