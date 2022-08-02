#!/bin/bash
echo "Список текстовых файлов:"
ls | grep .txt$
echo "Введите имя файла (без .txt) для преобразования в речь:"
read n
if [ -z "${n}" ]; then

    echo "Ничего не введено. Выход из программы."
    exit
fi

echo 'Введите имя для аудиозаписи:'
read a
if [ -z "${a}" ]; then
    echo "Ничего не введено. Выход из программы."
    exit
fi
read -r -p "Выберете язык (Рус/Анг) [Рус] " response
case "$response" in
    [Ee][nN]|[Аа]|[нН]|[гГ])  
        echo Выбран английский язык.
        proxychains gtts-cli -f $n.txt --output $a.mp3
        echo 'Текст переведённый в аудиозапись сохранён в файл: '$a'.mp3'
        ;;
    *)
        echo Выбран русский язык.
        proxychains gtts-cli -l ru -f $n.txt --output $a.mp3
        echo 'Текст переведённый в аудиозапись сохранён в файл: '$a'.mp3'

        ;;
esac
echo 'Текст переведённый в аудиозапись сохранён в файл: '$a'.mp3'

