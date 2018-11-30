#!/bin/bash
PASS_BASEPATH=$1
OUTPUT_FILE=$2
ACL_FILENAME=mosquitto.acl
USER_LIST=$(pass ${PASS_BASEPATH} | grep "─" | cut -c 11-)

touch ${OUTPUT_FILE}

for USERNAME in ${USER_LIST}; do
    PASSWORD=$(pass ${PASS_BASEPATH}/$USERNAME | head -n 1)
    mosquitto_passwd -b ${OUTPUT_FILE} ${USERNAME} ${PASSWORD}
done

# cat ${OUTPUT_FILE}