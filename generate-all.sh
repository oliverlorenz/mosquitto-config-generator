#!/bin/bash
export PASS_BASEPATH=$1
export CERT_HOSTNAME=$2
export OUTPUT_PATH=$3

./generate-passwd.sh ${PASS_BASEPATH} ${OUTPUT_PATH}/mosquitto.passwd
./generate-acl.sh ${PASS_BASEPATH} ${OUTPUT_PATH}/mosquitto.acl
./generate-conf.sh ${CERT_HOSTNAME} ${OUTPUT_PATH}/mosquitto.conf
