::docker up
@ECHO OFF
git clone git@github.com:symfony/symfony-standard.git php
docker-machine start
@FOR /f "tokens=*" %%i IN ('"docker-machine.exe" env') DO @%%i
docker-compose up -d
docker-machine ip
chmod 755 composer
cd php && rm -rf vendor/symfony && composer clearcache && composer install -o -n
:EOF