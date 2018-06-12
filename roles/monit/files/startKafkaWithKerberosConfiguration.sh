#!/bin/bash
export KAFKA_HEAP_OPTS='-Xmx256M'
export KAFKA_OPTS='-Djava.security.krb5.conf=/etc/krb5.conf -Djava.security.auth.login.config=/opt/kafka/config/kafka_server_jaas.conf'
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
