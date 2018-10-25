#!/bin/bash

echo $HOSTNAME

NAME=$NAME

if [ -z "$NAME" ]; then
  NAME=eureka-server
fi

NAMESPACE=$NAMESPACE

if [ -z "$NAMESPACE" ]; then
  NAMESPACE=default
fi

REPLICAS=$REPLICAS

if [ -z "$REPLICAS" ]; then
  REPLICAS=3
fi

ZONE=""

for((i=0;i<REPLICAS;i++));
do
    ZONE="${ZONE}http://${NAME}-${i}.${NAME}:1818/eureka/,"
done

ZONE=${ZONE%?}

export RUN_ARGS="--eureka.hostname=${HOSTNAME}.${NAME} --eureka.instance.hostname=${HOSTNAME}.${NAME} --eureka.client.serviceUrl.defaultZone=$ZONE $RUN_ARGS"

echo RUN_ARGS=$RUN_ARGS

/start.sh
