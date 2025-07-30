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

INSTALL_PATH="/usr/local/bin"
TEMP_DIR=$(mktemp -d)
TEMP_FILE="$TEMP_DIR/yt-dlp"

if ! $SU [ -w "$INSTALL_PATH" ]; then
    echo "Error: no write permissions for $INSTALL_PATH" >&2
    exit 1
fi

echo "Downloading the latest version of yt-dlp..."
if ! curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o "$TEMP_FILE"; then
    echo "Error: failed to download yt-dlp" >&2
    rm -rf "$TEMP_DIR"
    exit 1
fi

if [ ! -s "$TEMP_FILE" ]; then
    echo "Error: downloaded file is empty or corrupted" >&2
    rm -rf "$TEMP_DIR"
    exit 1
fi

chmod +x "$TEMP_FILE"

if ! $SU mv "$TEMP_FILE" "$INSTALL_PATH/yt-dlp"; then
    echo "Error: failed to install yt-dlp to $INSTALL_PATH" >&2
    rm -rf "$TEMP_DIR"
    exit 1
fi

rm -rf "$TEMP_DIR"

if command -v yt-dlp &> /dev/null; then
    echo "Installed yt-dlp version: $(yt-dlp --version)"
else
    echo "Error: yt-dlp not installed or not found in $INSTALL_PATH" >&2
    exit 1
fi

echo "Done! yt-dlp installed successfully."
