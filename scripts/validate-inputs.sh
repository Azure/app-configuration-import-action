#!/usr/bin/env bash

path="$1"
sourceName="$2"
appServiceAccountName="$3"

# Ensure only one of the input parameters are specified
SIMULATE_XOR="${path:+VALID}${sourceName:+VALID}${appServiceAccountName:+VALID}"
if [[ "${SIMULATE_XOR}" != "VALID" ]]; then 
  echo "Only one of the 'path', 'sourceName' and 'appServiceAccountName' input values is accepted."
  exit 1
fi
