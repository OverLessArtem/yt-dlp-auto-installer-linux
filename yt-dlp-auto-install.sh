#!/bin/bash
# Скрипт установки yt-dlp в /usr/local/bin
# By ArtemOver

# Загрузка последней версии yt-dlp
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O yt-dlp

chmod +x yt-dlp

sudo mv yt-dlp /usr/local/bin/yt-dlp

echo "Установлено yt-dlp версии: $(yt-dlp --version)"

