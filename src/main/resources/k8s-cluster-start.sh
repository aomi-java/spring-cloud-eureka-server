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
    ZONE="${ZONE}http://${NAME}-${i}.${NAME}.${NAMESPACE}/eureka/,"
done

ZONE=${ZONE%?}

APP_HOSTNAME="${HOSTNAME}.${NAME}.${NAMESPACE}"

export RUN_ARGS="--eureka.hostname=${APP_HOSTNAME} --eureka.instance.hostname=${APP_HOSTNAME} --eureka.client.serviceUrl.defaultZone=$ZONE $RUN_ARGS"

echo RUN_ARGS=$RUN_ARGS

/start.sh
