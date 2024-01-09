#!/bin/bash

DOMAIN=$1

IDN=$(echo "${DOMAIN}"|idn2)

echo "domain [ ${DOMAIN} (${IDN}) ]"
echo ""

curl -s ${DOMAIN}/____one.com_diagnostics/status.json

echo -n "DNS "
dig +short "${IDN}" ns|tr '\n' ' '
echo ""

echo -n "A "
dig +short "${IDN}"|tr '\n' ' '
echo ""

echo -n "MX "
dig +short "${IDN}" mx|tr '\n' ' '
echo ""

https systemsapi.one.com/v1/domains/${IDN} | jq -r '.data.attributes|[.product, .package]'

echo "Databases:"
https systemsapi.one.com/v1/domains/${IDN}/services/MySQL%20database/databases | jq -r '.data[].attributes| [.username, .password]'
