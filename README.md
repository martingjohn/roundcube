# roundcube
Simple Ubuntu container with Roundcube

Add your config to volume /var/roundcube/config

    docker run \
           -d \
           --name roundcube \
           -p 8580:80 \
           --restart=unless-stopped \
           -v /etc/localtime:/etc/localtime \
           -v ${PWD}/config:/var/roundcube/config \
           roundcube

