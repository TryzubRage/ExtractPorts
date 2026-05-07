Extraer puertos de archivos Nmap con bash

Aquí tienes la descripción para la herramienta:
Para el script
bash

sudo nano /usr/local/bin/extract_ports

Pega esto con la descripción incluida:
bash

#!/bin/bash
# ==============================================================================
# Extract Ports - Extractor de puertos para escaneos Nmap
# ==============================================================================
# Descripción:  Extrae puertos TCP abiertos de archivos .nmap y los copia
#               automáticamente al portapapeles en formato separado por comas.
#               Optimizado para escaneos sigilosos (TCP SYN -sS).
#
# Autor:        [Tu nombre]
# Versión:      1.0
# Uso:          extract_ports <archivo.nmap>
# Ejemplo:      extract_ports escaneo_sigiloso.nmap
#
# Salida:       22,80,443,3306,8080 (

dame el script en ingles todo en inglees

Here you go:
bash

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

Install on Kali:
bash

sudo cp extract_ports /usr/local/bin/extract_ports
sudo chmod +x /usr/local/bin/extract_ports
extract_ports scan.nmap

un mini readme
markdown

# extract_ports

[![Version](https://img.shields.io/badge/version-1.0-blue)]()

A simple Bash script to extract open TCP ports from Nmap scan files and copy them to clipboard in comma-separated format.

## 📋 Description

`extract_ports` parses `.nmap` files from stealth scans (`-sS`) and extracts all open ports, automatically copying them to your clipboard. Perfect for quickly grabbing ports and pasting them into other tools or commands.



# Paste the script content and save

# Make it executable
