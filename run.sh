#!/usr/bin/env bash

if [[ -n $OWNCLOUD_PORT_80_TCP_ADDR ]] 
then
	OC_SERVER=$OWNCLOUD_PORT_80_TCP_ADDR
fi

while [ "200" != $(curl --write-out %{http_code} --silent --output /dev/null http://$OC_SERVER/$OC_ROOT/status.php) ]
do
	echo -n "."
	sleep 1
done

bin/smash $*