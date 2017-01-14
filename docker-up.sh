#!/usr/bin/env bash
docker-machine start
eval $(docker-machine env)
docker-compose up -d
docker-machine ip
chmod 755 composer
cd php && rm -rf vendor/symfony && composer clearcache && composer install -o -n
#EOF