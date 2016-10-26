set containerId=
for /f "delims=" %%a in ('docker ps -aqf "name=laradock_php-fpm"') do @set containerId=%%a

set enableExtentionCmd=sed -i 's/^zend_extension=/;zend_extension=/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

docker exec -it --user=root %containerId% bash -c "%enableExtentionCmd%"
docker restart %containerId%
docker exec -it --user=root %containerId% bash -c "php -v"