# Simple Docker
Введение в докер. Разработка простого докер-образа для собственного сервера.


## Contents
1. [Answers](#answers)\
    1.1. [Готовый докер](#part-1-готовый-докер) \
    1.2. [Операции с контейнером](#part-2-операции-с-контейнером) \
    1.3. [Мини веб-сервер](#part-3-мини-веб-сервер) \
    1.4. [Свой докер](#part-4-свой-докер) \
    1.5. [Dockle](#part-5-dockle) \
    1.6. [Базовый Docker Compose](#part-6-базовый-docker-compose)



## Answers

## Part 1. Готовый докер


##### Возьми официальный докер-образ с **nginx** и выкачай его при помощи `docker pull`.
![docker pull](/src/screenshoots/1.png)
##### Проверь наличие докер-образа через `docker images`.
![docker images](/src/screenshoots/2.png)
##### Запусти докер-образ через `docker run -d [image_id|repository]` и Проверь, что образ запустился через `docker ps`.
![docker images](/src/screenshoots/3.png)

##### Посмотри информацию о контейнере через `docker inspect [container_id|container_name]`.
![docker images](/src/screenshoots/4.png)\

`IP контейнера - 172.17.0.2`\
![docker images](/src/screenshoots/5.png)\
`Размер контейнера - "ShmSize": 67108864 байт (64 МБ)`.\
![docker images](/src/screenshoots/6.png)\
`Cписок замапленных портов - "Ports": "80/tcp": null`\
![docker images](/src/screenshoots/7.png)\
\

##### Останови докер контейнер через `docker stop [container_id|container_name]` и проверь, что контейнер остановился через `docker ps`.
![docker images](/src/screenshoots/8.png)\


##### Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*.
![docker images](/src/screenshoots/9.png)\

##### Проверь, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**.
![docker images](/src/screenshoots/10.png)\

##### Перезапусти докер контейнер через `docker restart [container_id|container_name]` и проверь любым способом, что контейнер запустился.
![docker images](/src/screenshoots/11.png)\


## Part 2. Операции с контейнером

Докер-образ и контейнер готовы. Теперь можно покопаться в конфигурации **nginx** и отобразить статус страницы.

##### Прочитай конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*.
![docker images](/src/screenshoots/12.png)\

##### Создай на локальной машине файл *nginx.conf* и настрой в нем по пути */status* отдачу страницы статуса сервера **nginx**..
![docker images](/src/screenshoots/13.png)\

##### Скопируй созданный файл *nginx.conf* внутрь докер-образа через команду `docker cp` и перезапусти **nginx** внутри докер-образа через команду *exec*.
![docker images](/src/screenshoots/14.png)\

##### Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.
![docker images](/src/screenshoots/15.png)\

##### Экспортируй контейнер в файл *container.tar* через команду *export*. Останови контейнер. Удали образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры. Удали остановленный контейнер.
![docker images](/src/screenshoots/16.png)\
##### Импортируй контейнер обратно через команду *import*.
##### Запусти импортированный контейнер.
![docker images](/src/screenshoots/17.png)\
##### Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.
![docker images](/src/screenshoots/18.png)\


## Part 3. Мини веб-сервер

Все в папке server. Зайди в папку и запусти run.sh

## Part 4. Свой докер

Все в папке docker. Зайди в папку и запусти run.sh

## Part 5. **Dockle**

Все в папке dockle. Зайди в папку и запусти run.sh

## Part 6. **Docker-compose**

Все в папке yml. Зайди в папку и введи docker-compose up.
