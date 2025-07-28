#!/bin/bash
# Script to install yt-dlp to /usr/local/bin
# By ArtemOver

if command -v sudo &> /dev/null; then
    SU="sudo"
elif command -v doas &> /dev/null; then
    SU="doas"
else
    echo "Error: neither sudo nor doas is installed. Cannot continue" >&2
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "Error: 'curl' is not installed. Cannot download yt-dlp" >&2
    exit 1
fi

curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp

chmod +x yt-dlp

$SU mv yt-dlp /usr/local/bin/yt-dlp

# Show installed version
echo "Installed yt-dlp version: $(yt-dlp --version)"
