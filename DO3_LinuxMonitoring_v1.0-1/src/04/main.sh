#!/bin/bash

source print.sh
source get_system_info.sh
source color.sh

default_column1_background=6  # черный
default_column1_font_color=2   # белый
default_column2_background=3  # красный
default_column2_font_color=4 # синий

# Загружаем параметры из конфигурационного файла
if [ -f config.conf ]; then
    source config.conf
else
    echo "Файл конфигурации 'config.conf' отсутствует."
    exit 1
fi



# Проверяем наличие всех необходимых параметров
export c1_backgroun=${column1_background:-$default_column1_background}
export c1_font_color=${column1_font_color:-$default_column1_font_color}
export c2_backgroun=${column2_background:-$default_column2_background}
export c2_font_color=${column2_font_color:-$default_column2_font_color}

if [[ $c1_backgroun = $c1_font_color || $c2_backgroun = $c2_font_color ]]; then
    echo "Цвета шрифта и фона одного столбца не должны совпадать."
    echo "Пожалуйста, вызовите скрипт снова чтобы пареметры $1 и $2 имели разные значения, а так-же параметры $3 и $4 имели разные значения."
    exit 1
fi
# Примеры значений для демонстрации

# echo "column1_background: $c1_backgroun" 
# echo "column1_font_color: $c1_font_color"
# echo "column2_background: $c2_backgroun"
# echo "column2_font_color: $c2_font_color"

for i in "$c1_backgroun" "$c1_font_color" "$c2_backgroun" "$c2_font_color"; do
         if ! [[ $i =~ ^[1-6]$ ]]; then
        echo "На вход подан не верный аргумент. Значение аргумента $i должно быть от 1 до 6"
        exit 1
    fi
done


BG_COLOR_KEY=${colors_bg[c1_backgroun-1]}
COLOR_KEY=${colors[c1_font_color-1]}
BG_COLOR_VALUE=${colors_bg[c2_backgroun-1]}
COLOR_VALUE=${colors[c2_font_color-1]}

reset="\033[0m"

get_system_info
print_info