#!/bin/bash
# Script to install yt-dlp to /usr/local/bin
# By ArtemOver

# Download the latest version of yt-dlp
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O yt-dlp

chmod +x yt-dlp

sudo mv yt-dlp /usr/local/bin/yt-dlp

echo "Installed yt-dlp version: $(yt-dlp --version)"
