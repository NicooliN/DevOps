#!/bin/bash
START_TIME=$(date +%s.%N)

source top10_ex.sh
source top10_fl.sh
source top5_fol_and_info.sh

# Проверка наличия аргументов
if [ $# -ne 1 ]; then
    echo "Usage: script05.sh <directory_path>/"
    exit 1
fi

# Получение пути к каталогу
DIR_PATH=$1

# Проверяем, что переданный аргумент является директорией
if [ ! -d "$DIR_PATH" ]; then
    echo "Error: The provided path is not a directory."
    exit 1
fi

# Выводим общее количество папок, включая вложенные
echo "Total number of folders (including all nested ones) = $(find "$DIR_PATH" -type d | wc -l)"
# echo " "
top5_fol_and_info $DIR_PATH
# echo " "
get_top10_fl $DIR_PATH
# echo " "
get_top10_ex $DIR_PATH
# echo " "

END_TIME=$(date +%s.%N)
DIFF_SECONDS=$(bc <<< "scale=1; ($END_TIME - $START_TIME)/1")
echo "Script execution time (in seconds) = ${DIFF_SECONDS}"