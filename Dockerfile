FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
            ca-certificates \
            roundcube \
            roundcube-sqlite3 \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

COPY roundcube.conf /etc/apache2/sites-available/roundcube.conf
RUN a2dissite 000-default && \
    a2ensite roundcube

VOLUME /var/roundcube/config
COPY entrypoint.sh /root

ENTRYPOINT ["/bin/bash"]
CMD ["/root/entrypoint.sh"]


