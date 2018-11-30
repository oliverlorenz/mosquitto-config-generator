#!/bin/bash
PASS_BASEPATH=$1
OUTPUT_FILE=$2
USER_LIST=$(pass ${PASS_BASEPATH} | grep "─" | cut -c 11-)

echo "" > ${OUTPUT_FILE}
cat acl/SYS.acl >> ${OUTPUT_FILE}
for USERNAME in ${USER_LIST}; do
    ACL=$(pass ${PASS_BASEPATH}/$USERNAME | tail -n +2)
    echo "
user ${USERNAME}
${ACL}" >> ${OUTPUT_FILE}
done
cat acl/all-clients.acl >> ${OUTPUT_FILE}
# cat ${OUTPUT_FILE}