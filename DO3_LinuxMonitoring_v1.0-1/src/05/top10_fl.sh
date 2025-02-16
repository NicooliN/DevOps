#!/bin/bash

get_top10_fl(){
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
NR=1
find "$DIR_PATH" -type f -printf '%s %p\n' | sort -nr | head -n 10 | while read SIZE FILE; do
    # Преобразование размера файла в МБ или ГБ
    if (( SIZE > 1024 * 1024 * 1024 )); then
        UNIT="GB"
        HUMAN_SIZE=$(echo "scale=2; $SIZE / (1024 * 1024 * 1024)" | bc)
    elif (( SIZE > 1024 * 1024 )); then
        UNIT="MB"
        HUMAN_SIZE=$(echo "scale=2; $SIZE / (1024 * 1024)" | bc)
    else
        UNIT="KB"
        HUMAN_SIZE=$(echo "scale=2; $SIZE / 1024" | bc)
    fi
    
    # Определение формата файла
    FORMAT=${FILE##*.}
    
    echo "$((NR++)) - $FILE, ${HUMAN_SIZE} ${UNIT}, $FORMAT"
done
}