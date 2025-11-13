#!bin/bash

echo "Введіть файл для бекапу і пушу: "
read FILE

if [ ! -f "$FILE" ]; then

echo "Файлу "$FILE" не знайдено, створимо його"
touch "$FILE"

fi

if [ ! -f "$backups" ]; then

mkdir -p backups

fi

DATE=$(date +%Y-%m-%d-%H-%M-%S)
cp "$FILE" "./backups/${FILE}_${DATE}"
echo "Бекап успішний!"

sudo nano $FILE
git add $FILE

echo "Введіть повідомлення для коміту: "
read MASSAGE
git commit -m "$MASSAGE"
git push
echo "Комміт успішний!"
