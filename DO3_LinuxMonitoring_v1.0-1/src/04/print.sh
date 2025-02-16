#!/bin/bash

print_info(){

# Вывод данных
echo -e "${BG_COLOR_KEY}${COLOR_KEY}HOSTNAME =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$HOSTNAME${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}TIMEZONE =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$TIMEZONE${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}USER =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$USER${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}OS =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$OS${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}DATE =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$DATE${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}UPTIME =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$UPTIME${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}UPTIME_SEC =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$UPTIME_SEC${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}IP =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$IP${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}MASK =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$MASK${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}GATEWAY =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$GATEWAY${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}RAM_TOTAL =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$RAM_TOTAL${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}RAM_USED =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$RAM_USED${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}RAM_FREE =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$RAM_FREE${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}SPACE_ROOT =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$SPACE_ROOT MB${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}SPACE_ROOT_USED =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$SPACE_ROOT_USED MB${reset}"
echo -e "${BG_COLOR_KEY}${COLOR_KEY}SPACE_ROOT_FREE =${reset} ${BG_COLOR_VALUE}${COLOR_VALUE}$SPACE_ROOT_FREE MB${reset}"
# Сброс стилей в конце
echo -e $reset
}