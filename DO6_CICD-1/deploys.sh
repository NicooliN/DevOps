#!/bin/bash

# Переменные
SOURCE_DIR="artifacts"
TARGET_USER="yellinja"
TARGET_HOST="10.10.0.2"
TARGET_DIR="/usr/local/bin"

# Функция для вывода сообщений об ошибках и завершения скрипта
error_exit() {
  echo "$1" >&2
  exit 1
}

# Копирование s21_cat
scp $SOURCE_DIR/s21_cat $TARGET_USER@$TARGET_HOST:$TARGET_DIR || error_exit "Failed to copy s21_cat"

# Копирование s21_grep
scp $SOURCE_DIR/s21_grep $TARGET_USER@$TARGET_HOST:$TARGET_DIR || error_exit "Failed to copy s21_grep"

# Проверка наличия скопированных файлов
ssh $TARGET_USER@$TARGET_HOST ls $TARGET_DIR || error_exit "Failed to list files in $TARGET_DIR"

echo "Deployment successful"