#!/bin/bash
if [ -z "${2}" ]; then

    echo "tgttsru <Текстовый файл> <Имя файла для записи>"
    exit
fi
proxychains gtts-cli -l ru -f $1 --output $2.mp3
