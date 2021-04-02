#!/bin/bash
#@author Filip Oščádal <git@gscloud.cz>

. bin/_includes.sh

command -v docker >/dev/null 2>&1 || fail "Docker is NOT installed!"

if [ ! -r ".env" ]; then fail "Missing .env file!"; fi
export $(grep -v '^#' .env | grep -v "PROJECT_NAME" | xargs -d '\n')

if [ -z "$APP_NAME" ]; then fail "Missing APP_NAME definition!"; fi

docker exec $APP_NAME apt-get update -yqq
docker exec $APP_NAME apt-get install -yq libmcrypt-dev libreadline-dev
docker exec $APP_NAME docker-php-ext-install mbstring mysqli iconv mcrypt
docker restart $APP_NAME

exit 0
