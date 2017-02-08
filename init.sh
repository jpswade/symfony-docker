#!/usr/bin/env bash
[[ -d php/.git ]] || git clone git@github.com:symfony/symfony-demo.git php
docker-machine env default || docker-machine start default || docker-machine create default --driver virtualbox
eval $(docker-machine env)
bin/composer >/dev/null
composer install -o -n -d php
docker-compose up -d
DOCKER_IP=$(docker-machine ip)
echo http://${DOCKER_IP}
#EOF