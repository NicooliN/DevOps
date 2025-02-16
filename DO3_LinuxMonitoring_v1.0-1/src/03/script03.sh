#!/bin/bash

source print.sh
source get_system_info.sh
source color.sh

if [ $# -ne 4 ]; then
    echo "На вход должны подоваться 4 аргумента(числа от 1 до 6)"
    exit 1
fi
    for i in "$@"; do
        if ! [[ $i =~ ^[1-6]$ ]]; then
        echo "На вход подан не верный аргумент. Значение аргумента $i должно быть от 1 до 6"
        exit 1
    fi
done

if [[ $1 = $2 || $3 = $4 ]]; then
    echo "Цвета шрифта и фона одного столбца не должны совпадать."
    echo "Пожалуйста, вызовите скрипт снова чтобы пареметры $1 и $2 имели разные значения, а так-же параметры $3 и $4 имели разные значения."
    exit 1
fi

BG_COLOR_KEY=${colors_bg[$(($1 - 1))]}
COLOR_KEY=${colors[$(($2 - 1))]}

BG_COLOR_VALUE=${colors_bg[$(($3 - 1))]}
COLOR_VALUE=${colors[$(($4 - 1))]}

reset="\033[0m"

get_system_info
print_info


