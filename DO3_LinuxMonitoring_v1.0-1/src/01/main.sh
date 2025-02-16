#!/bin/bash

source check.sh

# Проверяем количество параметров
if [ $# -ne 1 ]; then
    echo "Необходимо передать ровно один параметр."
    exit 1
fi

check $1