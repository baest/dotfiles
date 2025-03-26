#!/usr/bin/env bash
# Activate AXFR for domain and setup ips
# Call with domain and AXFR IPs
# Depends on jq and httpie

DOMAIN=$1
shift
IPS="$@"

if [[ -z "$DOMAIN" ]]; then
  echo "Provide DOMAIN!"
  exit 1
fi

if [[ -z "$IPS" ]]; then
  echo "Provide IPS!"
  exit 1
fi

JSON=$(
  cat <<'EOF'
{
  "data": {
    "type": "domains",
    "id": $domain,
    "attributes": {
      "axfr_active": true,
      "axfr_ips": $ips|split(" "),
      "dnssec_wanted": false
    }
  }
}
EOF
)

JSON=$(jq --compact-output --null-input --arg ips "$IPS" --arg domain "$DOMAIN" "$JSON")

echo $JSON | https PATCH systemsapi.one.com/v2/brands/one.com/domains/$DOMAIN
