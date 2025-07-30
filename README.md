# yt-dlp-auto-installer-linux

A dumb simple Bash script to auto-install the latest `yt-dlp` to `/usr/local/bin`.  
Downloads the latest version, sets it up with proper permissions, and works on most Linux distros.

[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](http://www.wtfpl.net/)

## Why Use This?
- One-command setup for the latest `yt-dlp`.
- Checks for `sudo` or `doas` automatically.
- Safe and clean: uses temp files, checks permissions, and verifies installation.

## Requirements
- `python3` (required for `yt-dlp`)
- `curl` (to download the binary)
- `sudo` or `doas` (for installing to `/usr/local/bin`)

## How to Install
```bash
git clone https://github.com/OverLessArtem/yt-dlp-auto-installer-linux.git
cd yt-dlp-auto-installer-linux
chmod +x yt-dlp-auto-install.sh
./yt-dlp-auto-install.sh
