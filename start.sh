#!/usr/bin/env bash

docker rm -f mysql owncloud

docker run -d --name mysql -h mysql -e MYSQL_ROOT_PASSWORD=oc mysql
docker run -d --name owncloud -h owncloud --link mysql:mysql -e ADMINLOGIN=test -e ADMINPWD=test morrisjobke/owncloud

docker run --rm --name smashbox --link owncloud:owncloud -e OC_ROOT=owncloud morrisjobke/smashbox -a lib/
