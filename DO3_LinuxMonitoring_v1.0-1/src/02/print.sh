#!/bin/bash

print_info(){
 # Вывод
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT MB"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"

#Сохранение в файл
read -p "Сохранить вывод в файл? [Y/n]: " answer
if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    
    FILE_NAME=$(date +"%d_%m_%y_%H_%M_%S")
    OUT_FILE="${FILE_NAME}.status"

     # Записываем в файл
    echo "HOSTNAME = $HOSTNAME" > "$OUT_FILE"
    echo "TIMEZONE = $TIMEZONE" >> "$OUT_FILE"
    echo "USER = $USER" >> "$OUT_FILE"
    echo "OS = $OS" >> "$OUT_FILE"
    echo "DATE = $DATE" >> "$OUT_FILE"
    echo "UPTIME = $UPTIME" >> "$OUT_FILE"
    echo "UPTIME_SEC = $UPTIME_SEC" >> "$OUT_FILE"
    echo "IP = $IP" >> "$OUT_FILE"
    echo "MASK = $MASK" >> "$OUT_FILE"
    echo "GATEWAY = $GATEWAY" >> "$OUT_FILE"
    echo "RAM_TOTAL = $RAM_TOTAL" >> "$OUT_FILE"
    echo "RAM_USED = $RAM_USED" >> "$OUT_FILE"
    echo "RAM_FREE = $RAM_FREE" >> "$OUT_FILE"
    echo "SPACE_ROOT = $SPACE_ROOT MB" >> "$OUT_FILE"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB" >> "$OUT_FILE"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB" >> "$OUT_FILE"
    
    echo "Сохранено в файл -> ${OUT_FILE}."
else
    echo "Данные не сохранены"
fi
}