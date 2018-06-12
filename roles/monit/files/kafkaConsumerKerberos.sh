#!/bin/bash
sudo kinit -k -t /etc/security/keytabs/kafka.keytab kafka/admin && /opt/kafka/bin/kafka-acls.sh \
    --authorizer-properties zookeeper.connect=broker1.example.com:2181,broker2.example.com:2181,broker3.example.com:2181 \
    --add --allow-principal User:kafka_consumer --consumer --topic=* --group=*

/opt/kafka/bin/kafka-topics.sh --create --topic test --partitions 3 --replication-factor 3 \
    --zookeeper broker1.example.com:2181,broker2.example.com:2181,broker3.example.com:2181

/opt/kafka/bin/kafka-topics.sh --describe --topic test \
    --zookeeper broker1.example.com:2181,broker2.example.com:2181,broker3.example.com:2181

/opt/kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server broker1.example.com:9093,broker2.example.com:9093,broker3.example.com:9093 \
    --topic test --from-beginning --consumer.config /opt/kafka/config/kafka_client.properties
