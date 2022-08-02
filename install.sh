#!/bin/bash
echo "Установим необходимые дя работы компоненты. Нажмите Enter для начала."
read
sudo apt-get install python3 tor obfs4proxy proxychains mpv links2 curl pip
sudo pip install gTTS
echo =====================================================================================================================
echo "Если установщик не выдал ошибок, то компоненты были успешно установлены."
echo ""
echo "Далее проверим работу Tor. Нажмите Enter для начала. После загрузки страницы нажмите q для выхода."
read
links2 -socks-proxy 127.0.0.1:9050 https://check.torproject.org
echo "Если страница успешно загрузилась, значит Tor работает."
echo "Теперь проверим работу proxychains. Нажмите Enter для начала."
read
proxychains curl https://check.torproject.org
echo "Если выдаётся длинный текст ответа, значит proxychains работает."
echo "Теперь проверим работу gTTS. Нажмите Enter для начала."
proxychains gtts-cli 'Test for enlgich language' --output en.mp3
proxychains gtts-cli -l ru 'Тест русского языка' --output ru.mp3
echo "Нажмите Enter для теста английского языка."
read
mpv en.mp3
echo "Нажмите Enter для теста русского языка."
read
mpv ru.mp3
rm ru.mp3 en.mp3
echo "Если вы услышали звуковые дорожки с фразами на английском и русском языках, значит программа успешно установлена."
echo ""
read -r -p "Установить программу в /bin для возможности её запуска из любого места через терминал? [Нет] " response
case "$response" in
    [yY][eE][sS]|[yY]|[Дд]|[Аа]) 
        sudo cp tgtts.sh /bin/tgtts
        sudo chmod +x /bin/tgtts
        sudo cp tgttsru.sh /bin/tgttsru
        sudo chmod +x /bin/tgttsru
        echo "Файлы программы установлены в /bin/tgtts и /bin/tgtssru. Для её запуска наберите в терминале tgtts."
        echo "Для быстрого перевода русского текста в речь наберите: tgttsru <Текстовый файл> <Имя файла для записи> "
        ;;
    *)
        echo "Программа успешно установлена. Для её запуска наберите ./tgtts , находясь в директории:"
        pwd
        echo "Для быстрого перевода русского текста в речь наберите: tgttsru <Текстовый файл> <Имя файла для записи> , находясь в той же директории."
        ;;
esac
