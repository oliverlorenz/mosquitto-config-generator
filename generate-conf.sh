#!/bin/bash
export CERT_HOSTNAME=$1
OUTPUT_FILE=$2
envsubst < conf > $OUTPUT_FILE