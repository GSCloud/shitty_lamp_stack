#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

. bin/_includes.sh

command -v docker >/dev/null 2>&1 || fail "Docker is NOT installed!"

if [ ! -r ".env" ]; then fail "Missing .env file!"; fi
export $(grep -v '^#' .env | grep -v "PROJECT_NAME" | xargs -d '\n')

if [ -z "$APP_NAME" ]; then fail "Missing APP_NAME definition!"; fi
if [ -z "$DB_NAME" ]; then fail "Missing DB_NAME definition!"; fi
if [ -z "$PMA_NAME" ]; then fail "Missing PMA_NAME definition!"; fi

mkdir -p db

info Stopping $APP_NAME
docker stop $APP_NAME 2>/dev/null

info Stopping $DB_NAME
docker stop $DB_NAME 2>/dev/null

info Stopping $PMA_NAME
docker stop $PMA_NAME 2>/dev/null
echo -en "\n"

docker-compose up -d
echo -en "\n"

docker-compose ps
echo -en "\n"

info "APP settings:"
docker exec $APP_NAME php -i | grep 'memory_limit'
docker exec $APP_NAME php -i | grep 'upload_max_filesize'
echo -en "\n"

info "PHP extesions:"
docker exec $APP_NAME php -m | grep mbstring
docker exec $APP_NAME php -m | grep mysqli
echo -en "\n"

info "PMA settings:"
docker exec $PMA_NAME php -i | grep 'memory_limit'
docker exec $PMA_NAME php -i | grep 'upload_max_filesize'
echo -en "\n"

exit 0
