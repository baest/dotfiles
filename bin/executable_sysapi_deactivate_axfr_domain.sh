#!/usr/bin/env bash
# Deactivate AXFR for domain
# Call with domain
# Depends on jq and httpie

DOMAIN=$1
if [[ -z "$DOMAIN" ]]; then
  echo "Provide DOMAIN!";
  exit 1
fi

JSON=$(cat <<'EOF'
{
  "data": {
    "type": "domains",
    "id": $domain,
    "attributes": {
      "axfr_active": false,
      "axfr_ips": []
    }
  }
}
EOF
)

JSON=$(jq --compact-output --null-input --arg domain "$DOMAIN" "$JSON")

echo $JSON | https PATCH systemsapi.one.com/v2/brands/one.com/domains/$DOMAIN


