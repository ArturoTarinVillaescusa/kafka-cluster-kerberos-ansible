#!/bin/bash
export KAFKA_HEAP_OPTS='-Xmx256M'
export KAFKA_OPTS='-Djava.security.auth.login.config=/opt/kafka/config/zookeeper_jaas.conf'
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties