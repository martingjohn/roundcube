#!/bin/bash

sed -i.bak '/added by docker/d' /etc/roundcube/config.inc.php

for config in `ls /var/roundcube/config/*.php 2>/dev/null || true`
do
	echo "include_once('$config'); // added by docker" >> /etc/roundcube/config.inc.php
done

#service apache2 restart
#sleep inf
/usr/sbin/apache2ctl -DFOREGROUND
