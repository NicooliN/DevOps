#!/bin/bash

top5_fol_and_info(){
# Топ-5 папок по весу
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
du -hsx "$DIR_PATH"/* | sort -rh | head -n 5 | awk '{print NR "-", $2, ", " $1}' | sed 's|//|/|g'

# Общее количество файлов
echo "Total number of files = $(find "$DIR_PATH" -type f | wc -l)"

# Количество различных типов файлов
CONF_FILES=$(find "$DIR_PATH" -name '*.conf' | wc -l)
TEXT_FILES=$(find "$DIR_PATH" -name '*.*' -exec file {} + | grep 'text' | wc -l)
EXECUTABLE_FILES=$(find "$DIR_PATH" -perm /u+x -type f | wc -l)
LOG_FILES=$(find "$DIR_PATH" -name '*.log' | wc -l)
ARCHIVE_FILES=$(find "$DIR_PATH" -name '*.zip' -o -name '*.tar.gz' -o -name '*.rar' -o -name '*.7z' | wc -l)
SYMLINKS=$(find "$DIR_PATH" -type l | wc -l)
# echo " "
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TEXT_FILES"
echo "Executable files = $EXECUTABLE_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARCHIVE_FILES"
echo "Symbolic links = $SYMLINKS"
}